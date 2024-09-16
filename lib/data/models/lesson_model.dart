import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_js/flutter_js.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class Lesson extends Equatable {
  final String id;
  final String title;
  final String description;
  final List<LessonSection> sections;
  final String difficulty;
  final int durationMinutes;
  final IconData icon;
  final bool isCompleted;

  const Lesson({
    required this.id,
    required this.title,
    required this.description,
    required this.sections,
    required this.difficulty,
    required this.durationMinutes,
    required this.icon,
    this.isCompleted = false,
  });

  Lesson copyWith({
    bool? isCompleted,
    List<LessonSection>? sections,
  }) {
    return Lesson(
      id: id,
      title: title,
      description: description,
      sections: sections ?? this.sections,
      difficulty: difficulty,
      durationMinutes: durationMinutes,
      icon: icon,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        sections,
        difficulty,
        durationMinutes,
        icon,
        isCompleted,
      ];
}

class LessonSection extends Equatable {
  final String content;
  final String? codeExample;
  final List<Exercise> exercises;

  const LessonSection({
    required this.content,
    this.codeExample,
    this.exercises = const [],
  });

  LessonSection copyWith({
    String? content,
    String? codeExample,
    List<Exercise>? exercises,
  }) {
    return LessonSection(
      content: content ?? this.content,
      codeExample: codeExample ?? this.codeExample,
      exercises: exercises ?? this.exercises,
    );
  }

  @override
  List<Object?> get props => [content, codeExample, exercises];
}

class Exercise extends Equatable {
  final String question;
  final String initialCode;
  final Future<bool> Function(JavascriptRuntime, String code)? validator;
  final bool isCompleted;

  const Exercise({
    required this.question,
    required this.initialCode,
    required this.validator,
    this.isCompleted = false,
  });

  Exercise copyWith({
    bool? isCompleted,
  }) {
    return Exercise(
      question: question,
      initialCode: initialCode,
      validator: validator,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  List<Object?> get props => [question, initialCode, isCompleted];
}
