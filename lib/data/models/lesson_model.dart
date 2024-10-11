import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_js/flutter_js.dart';

class Lesson {
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
    required this.difficulty,
    required this.durationMinutes,
    required this.icon,
    this.sections = const [],
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
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Lesson &&
        other.id == id &&
        other.title == title &&
        other.description == description &&
        other.difficulty == difficulty &&
        other.durationMinutes == durationMinutes &&
        other.icon == icon &&
        other.isCompleted == isCompleted;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        difficulty.hashCode ^
        durationMinutes.hashCode ^
        icon.hashCode ^
        isCompleted.hashCode;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'sections': sections.map((x) => x.toMap()).toList(),
      'difficulty': difficulty,
      'durationMinutes': durationMinutes,
      'icon': {
        'codePoint': icon.codePoint,
        'fontFamily': icon.fontFamily,
        'fontPackage': icon.fontPackage,
      },
      'isCompleted': isCompleted,
    };
  }
}

class LessonSection {
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
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LessonSection &&
        other.content == content &&
        other.codeExample == codeExample &&
        listEquals(other.exercises, exercises);
  }

  @override
  int get hashCode {
    return content.hashCode ^ codeExample.hashCode ^ exercises.hashCode;
  }

  Map<String, dynamic> toMap() {
    return {
      'content': content,
      'codeExample': codeExample,
      'exercises': exercises.map((x) => x.toMap()).toList(),
    };
  }
}

class Exercise {
  final String question;
  final String initialCode;
  final String validate;
  final bool isCompleted;

  const Exercise({
    required this.question,
    required this.initialCode,
    required this.validate,
    this.isCompleted = false,
  });

  Exercise copyWith({
    bool? isCompleted,
  }) {
    return Exercise(
      question: question,
      initialCode: initialCode,
      validate: validate,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Exercise &&
        other.question == question &&
        other.initialCode == initialCode &&
        other.isCompleted == isCompleted &&
        other.validate == validate;
  }

  @override
  int get hashCode {
    return question.hashCode ^
        initialCode.hashCode ^
        isCompleted.hashCode ^
        validate.hashCode;
  }

  Map<String, dynamic> toMap() {
    return {
      'question': question,
      'initialCode': initialCode,
      'validate': validate,
      'isCompleted': isCompleted,
    };
  }
}
