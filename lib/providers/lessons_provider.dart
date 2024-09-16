import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../core.dart';
import '../data.dart';
import 'common_providers.dart';

part 'lessons_provider.g.dart';

@riverpod
class Lessons extends _$Lessons {
  LocalStorage get storage => ref.read(localStorageProvider);

  @override
  List<Lesson> build() {
    final completedLessons = storage.completedLessons;
    return lessonsList.map((lesson) {
      final isCompleted = completedLessons.contains(lesson.id);
      return lesson.copyWith(isCompleted: isCompleted);
    }).toList();
  }

  void toggleLessonCompletion(String lessonId) {
    final completedLessons = storage.completedLessons;
    final isCompleted = completedLessons.contains(lessonId);

    if (isCompleted) {
      completedLessons.remove(lessonId);
    } else {
      completedLessons.add(lessonId);
    }

    storage.completedLessons = completedLessons;
  }

  void updateExerciseCompletion({
    required String lessonId,
    required LessonSection section,
    required Exercise exercise,
  }) {
    state = state.map((lesson) {
      if (lesson.id == lessonId) {
        final updatedSections = lesson.sections.map((s) {
          if (s == section) {
            final updatedExercises = s.exercises.map((e) {
              if (e.question == exercise.question) {
                return exercise.copyWith(isCompleted: true);
              }
              return e;
            }).toList();

            return section.copyWith(exercises: updatedExercises);
          }
          return s;
        }).toList();

        return lesson.copyWith(
          sections: updatedSections,
          isCompleted: updatedSections
              .every((s) => s.exercises.every((e) => e.isCompleted)),
        );
      }
      return lesson;
    }).toList();

    final lesson = state.firstWhere((lesson) => lesson.id == lessonId);
    if (lesson.isCompleted) {
      toggleLessonCompletion(lessonId);
    }
  }
}
