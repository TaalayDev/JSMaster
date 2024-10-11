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

  factory Quiz.fromMap(Map<String, dynamic> map) {
    return Quiz(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      difficulty: map['difficulty'],
      durationMinutes: map['durationMinutes'],
      questions: List<QuizQuestion>.from(
          map['questions']?.map((x) => QuizQuestion.fromMap(x))),
      isCompleted: false,
    );
  }

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

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'difficulty': difficulty,
      'durationMinutes': durationMinutes,
      'questions': questions.map((x) => x.toMap()).toList(),
    };
  }
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

  factory QuizQuestion.fromMap(Map<String, dynamic> map) {
    return QuizQuestion(
      question: map['question'],
      options: List<String>.from(map['options']),
      correctOptionIndex: map['correctOptionIndex'],
    );
  }

  @override
  List<Object?> get props => [
        question,
        options,
        correctOptionIndex,
      ];

  Map<String, dynamic> toMap() {
    return {
      'question': question,
      'options': options,
      'correctOptionIndex': correctOptionIndex,
    };
  }
}
