import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../core.dart';
import '../data.dart';
import 'common_providers.dart';
import 'lessons_provider.dart';

part 'quizz_provider.g.dart';

@riverpod
class QuizzState extends _$QuizzState {
  LocalStorage get storage => ref.read(localStorageProvider);

  @override
  List<Quiz> build() {
    final completedQuizzes = storage.completedQuizzes;
    final quizzes =
        ref.watch(lessonsCacheProvider).valueOrNull?.quizzes ?? const <Quiz>[];
    return quizzes.map((quiz) {
      final isCompleted = completedQuizzes.contains(quiz.id);
      return quiz.copyWith(isCompleted: isCompleted);
    }).toList();
  }

  void toggleQuizzCompletion(String quizId) {
    final completedQuizzes = storage.completedQuizzes;

    completedQuizzes.add(quizId);

    storage.completedQuizzes = completedQuizzes;

    state = state.map((quiz) {
      if (quiz.id == quizId) {
        return quiz.copyWith(isCompleted: true);
      }
      return quiz;
    }).toList();
  }

  Quiz? nextQuizz(String quizId) {
    final index = quizzesList.indexWhere((quiz) => quiz.id == quizId);
    if (index == -1 || index == quizzesList.length - 1) {
      return null;
    }
    return quizzesList[index + 1];
  }
}
