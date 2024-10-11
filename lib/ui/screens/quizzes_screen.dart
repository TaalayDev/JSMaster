import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data.dart';
import '../../providers/quizz_provider.dart';

class QuizzesScreen extends HookConsumerWidget {
  const QuizzesScreen({super.key});

  int calculateProgress(List<Quiz> quizzes) {
    final completedQuizzes = quizzes.where((quiz) => quiz.isCompleted).length;
    return (completedQuizzes / quizzes.length * 100).toInt();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizzes = ref.watch(quizzStateProvider);
    print(quizzes);
    final progress = calculateProgress(quizzes);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quizzes'),
        actions: [
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
        ],
      ),
      body: AdaptiveQuizGrid(quizzes: quizzes),
    );
  }
}

class AdaptiveQuizGrid extends StatelessWidget {
  final List<Quiz> quizzes;

  const AdaptiveQuizGrid({super.key, required this.quizzes});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return _buildListView();
        } else if (constraints.maxWidth < 1200) {
          return _buildGridView(crossAxisCount: 2);
        } else {
          return _buildGridView(crossAxisCount: 3);
        }
      },
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      itemCount: quizzes.length,
      itemBuilder: (context, index) {
        return QuizCard(quiz: quizzes[index]);
      },
    );
  }

  Widget _buildGridView({required int crossAxisCount}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: MasonryGridView.count(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        itemBuilder: (context, index) {
          return QuizCard(quiz: quizzes[index]);
        },
        itemCount: quizzes.length,
      ),
    );
  }
}

class QuizCard extends StatelessWidget {
  final Quiz quiz;

  const QuizCard({super.key, required this.quiz});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => QuizScreen(quiz: quiz),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: quiz.isCompleted
                ? Border.all(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2,
                  )
                : null,
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
                        color: Theme.of(context).colorScheme.secondaryContainer,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Feather.help_circle,
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        quiz.title,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  quiz.description,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildInfoChip(
                      context,
                      icon: Feather.activity,
                      label: quiz.difficulty,
                      color: _getDifficultyColor(quiz.difficulty),
                    ),
                    _buildInfoChip(
                      context,
                      icon: Feather.clock,
                      label: '${quiz.durationMinutes} min',
                      color: Theme.of(context).colorScheme.secondary,
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

class QuizScreen extends ConsumerStatefulWidget {
  final Quiz quiz;

  const QuizScreen({super.key, required this.quiz});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends ConsumerState<QuizScreen> {
  int _currentQuestionIndex = 0;
  List<int?> _userAnswers = [];

  @override
  void initState() {
    super.initState();
    _userAnswers = List.filled(widget.quiz.questions.length, null);
  }

  void _selectAnswer(int answerIndex) {
    setState(() {
      _userAnswers[_currentQuestionIndex] = answerIndex;
    });
  }

  void _nextQuestion() {
    if (_currentQuestionIndex < widget.quiz.questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
    } else {
      int correctAnswers = 0;
      for (int i = 0; i < widget.quiz.questions.length; i++) {
        if (_userAnswers[i] == widget.quiz.questions[i].correctOptionIndex) {
          correctAnswers++;
        }
      }

      final provider = ref.read(quizzStateProvider.notifier);
      final next = provider.nextQuizz(widget.quiz.id);

      _showResults(
        correctAnswers: correctAnswers,
        next: next,
      );
      if (correctAnswers == widget.quiz.questions.length) {
        provider.toggleQuizzCompletion(widget.quiz.id);
      }
    }
  }

  void _previousQuestion() {
    if (_currentQuestionIndex > 0) {
      setState(() {
        _currentQuestionIndex--;
      });
    }
  }

  void _showResults({
    required int correctAnswers,
    Quiz? next,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Quiz Results'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'You got $correctAnswers out of ${widget.quiz.questions.length} questions correct.',
            ),
            const SizedBox(height: 16),
            CircularProgressIndicator(
              value: correctAnswers / widget.quiz.questions.length,
              backgroundColor:
                  Theme.of(context).colorScheme.surfaceContainerHighest,
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '${(correctAnswers / widget.quiz.questions.length * 100).toStringAsFixed(1)}%',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
        actions: [
          if (next != null)
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizScreen(quiz: next),
                  ),
                );
              },
              child: const Text('Next Quiz'),
            ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: const Text('Finish'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.quiz.title),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 600) {
              return _buildMobileLayout();
            } else if (constraints.maxWidth < 1200) {
              return _buildTabletLayout();
            } else {
              return _buildDesktopLayout();
            }
          },
        ),
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        _buildProgressIndicator(),
        Expanded(child: _buildQuestionCard()),
        _buildNavigationButtons(),
      ],
    );
  }

  Widget _buildTabletLayout() {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: _buildQuestionCard(),
        ),
        Expanded(
          flex: 3,
          child: Column(
            children: [
              _buildProgressIndicator(),
              Expanded(child: _buildAnswerOptions()),
              _buildNavigationButtons(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: _buildQuestionList(),
        ),
        Expanded(
          flex: 3,
          child: Column(
            children: [
              _buildProgressIndicator(),
              Expanded(child: _buildQuestionCard()),
              _buildNavigationButtons(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProgressIndicator() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: LinearProgressIndicator(
        value: (_currentQuestionIndex + 1) / widget.quiz.questions.length,
        backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
        valueColor: AlwaysStoppedAnimation<Color>(
          Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }

  Widget _buildQuestionCard() {
    final question = widget.quiz.questions[_currentQuestionIndex];
    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 0,
      color: Theme.of(context).colorScheme.surfaceVariant,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Question ${_currentQuestionIndex + 1}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              question.question,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            Expanded(child: _buildAnswerOptions()),
          ],
        ),
      ),
    );
  }

  Widget _buildAnswerOptions() {
    final question = widget.quiz.questions[_currentQuestionIndex];
    return ListView.builder(
      itemCount: question.options.length,
      itemBuilder: (context, index) {
        final isSelected = _userAnswers[_currentQuestionIndex] == index;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: FilledButton(
            onPressed: () => _selectAnswer(index),
            style: FilledButton.styleFrom(
              backgroundColor: isSelected
                  ? Theme.of(context).colorScheme.primaryContainer
                  : Theme.of(context).colorScheme.surface,
              foregroundColor: isSelected
                  ? Theme.of(context).colorScheme.onPrimaryContainer
                  : Theme.of(context).colorScheme.onSurface,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(question.options[index]),
            ),
          ),
        );
      },
    );
  }

  Widget _buildNavigationButtons() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FilledButton.tonal(
            onPressed: _currentQuestionIndex > 0 ? _previousQuestion : null,
            child: const Text('Previous'),
          ),
          FilledButton(
            onPressed: _userAnswers[_currentQuestionIndex] != null
                ? _nextQuestion
                : null,
            child: Text(
              _currentQuestionIndex < widget.quiz.questions.length - 1
                  ? 'Next'
                  : 'Finish',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionList() {
    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 0,
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: ListView.builder(
        itemCount: widget.quiz.questions.length,
        itemBuilder: (context, index) {
          final isAnswered = _userAnswers[index] != null;
          final isCurrentQuestion = _currentQuestionIndex == index;

          return ListTile(
            leading: CircleAvatar(
              backgroundColor: isAnswered
                  ? Theme.of(context).colorScheme.primaryContainer
                  : Theme.of(context).colorScheme.surface,
              foregroundColor: isAnswered
                  ? Theme.of(context).colorScheme.onPrimaryContainer
                  : Theme.of(context).colorScheme.onSurface,
              child: Text('${index + 1}'),
            ),
            title: Text(
              widget.quiz.questions[index].question,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            onTap: _userAnswers[index] != null
                ? () {
                    setState(() {
                      _currentQuestionIndex = index;
                    });
                  }
                : null,
            selected: isCurrentQuestion,
            selectedTileColor: Theme.of(context).colorScheme.primaryContainer,
            selectedColor: Theme.of(context).colorScheme.onPrimaryContainer,
          );
        },
      ),
    );
  }
}
