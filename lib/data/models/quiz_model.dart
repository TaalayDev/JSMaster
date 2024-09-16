import 'package:equatable/equatable.dart';

class Quiz extends Equatable {
  final String id;
  final String title;
  final String description;
  final String difficulty;
  final int durationMinutes;
  final List<QuizQuestion> questions;
  final bool isCompleted;

  const Quiz({
    required this.id,
    required this.title,
    required this.description,
    required this.difficulty,
    required this.durationMinutes,
    required this.questions,
    this.isCompleted = false,
  });

  Quiz copyWith({
    String? id,
    String? title,
    String? description,
    String? difficulty,
    int? durationMinutes,
    List<QuizQuestion>? questions,
    bool? isCompleted,
  }) {
    return Quiz(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      difficulty: difficulty ?? this.difficulty,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      questions: questions ?? this.questions,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        difficulty,
        durationMinutes,
        questions,
        isCompleted,
      ];
}

class QuizQuestion extends Equatable {
  final String question;
  final List<String> options;
  final int correctOptionIndex;

  const QuizQuestion({
    required this.question,
    required this.options,
    required this.correctOptionIndex,
  });

  @override
  List<Object?> get props => [
        question,
        options,
        correctOptionIndex,
      ];
}
