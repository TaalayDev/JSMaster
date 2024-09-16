import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data.dart';
import '../../core.dart';
import '../../providers/lessons_provider.dart';

class LessonsScreen extends HookConsumerWidget {
  const LessonsScreen({super.key});

  int calculateProgress(List<Lesson> lessons) {
    final completedLessons =
        lessons.where((lesson) => lesson.isCompleted).length;
    return (completedLessons / lessons.length * 100).toInt();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lessons = ref.watch(lessonsProvider);
    final progress = calculateProgress(lessons);

    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            const SizedBox(width: 16),
            Container(
              height: 32,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Center(
                child: Text(
                  'completed $progress%',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            TextButton.icon(
              icon: const Icon(Feather.book_open),
              label: const Text('Quizzes'),
              onPressed: () {
                const QuizzesRoute().push(context);
              },
              style: TextButton.styleFrom(
                backgroundColor:
                    Theme.of(context).colorScheme.primary.withOpacity(0.1),
              ),
            ),
          ],
        ),
        leadingWidth: 290,
        actions: [
          IconButton(
            icon: const Icon(Feather.info),
            onPressed: () => const AboutAppRoute().push(context),
          ),
        ],
      ),
      body: AdaptiveLessonGrid(lessons: lessons),
    );
  }
}

class ProgressTracker extends StatelessWidget {
  final List<Lesson> lessons;
  final List<Quiz> quizzes;

  const ProgressTracker({
    super.key,
    required this.lessons,
    required this.quizzes,
  });

  @override
  Widget build(BuildContext context) {
    final completedLessons =
        lessons.where((lesson) => lesson.isCompleted).length;
    final completedQuizzes =
        quizzes.where((quiz) => quiz.questions.isEmpty).length;

    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Progress',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            _buildProgressBar(
              context,
              label: 'Lessons',
              completed: completedLessons,
              total: lessons.length,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 8),
            _buildProgressBar(
              context,
              label: 'Quizzes',
              completed: completedQuizzes,
              total: quizzes.length,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressBar(
    BuildContext context, {
    required String label,
    required int completed,
    required int total,
    required Color color,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label: $completed / $total',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 4),
        LinearProgressIndicator(
          value: completed / total,
          backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
          valueColor: AlwaysStoppedAnimation<Color>(color),
        ),
      ],
    );
  }
}

class AdaptiveLessonGrid extends StatelessWidget {
  final List<Lesson> lessons;

  const AdaptiveLessonGrid({super.key, required this.lessons});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final crossAxisCount = width < 600 ? 1 : (width < 1200 ? 2 : 3);

        return MasonryGridView.count(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          padding: const EdgeInsets.all(16),
          itemCount: lessons.length,
          itemBuilder: (context, index) {
            return LessonCard(
              lesson: lessons[index],
              isAvailable: index == 0 || lessons[index - 1].isCompleted,
            );
          },
        );
      },
    );
  }
}

class LessonCard extends StatelessWidget {
  final Lesson lesson;
  final bool isAvailable;

  const LessonCard({
    super.key,
    required this.lesson,
    this.isAvailable = true,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap:
            isAvailable ? () => LessonRoute(id: lesson.id).push(context) : null,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: lesson.isCompleted
                ? Border.all(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2,
                  )
                : null,
            color: lesson.isCompleted
                ? null
                : isAvailable
                    ? null
                    : Theme.of(context).colorScheme.surfaceContainerHighest,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        lesson.icon,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        '${lesson.id}. ${lesson.title}',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  lesson.description,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: _buildInfoChip(
                        context,
                        icon: Feather.activity,
                        label: lesson.difficulty,
                        color: _getDifficultyColor(lesson.difficulty),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _buildInfoChip(
                        context,
                        icon: Feather.clock,
                        label: '${lesson.durationMinutes} min',
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoChip(
    BuildContext context, {
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: color, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Color _getDifficultyColor(String difficulty) {
    switch (difficulty.toLowerCase()) {
      case 'beginner':
        return Colors.green;
      case 'intermediate':
        return Colors.orange;
      case 'advanced':
        return Colors.red;
      default:
        return Colors.blue;
    }
  }
}
