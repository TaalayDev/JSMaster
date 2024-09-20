import 'package:dart_eval/dart_eval_bridge.dart';
import 'package:eval_annotation/eval_annotation.dart';
import 'package:flutter/material.dart';
import 'package:jsmaster/data/models/lesson_model.dart';

class IconDataBridge {
  final int codePoint;
  final String fontFamily;
  final String fontPackage;

  IconDataBridge(this.codePoint, this.fontFamily, this.fontPackage);
}

class LessonBridge {
  final String id;
  final String title;
  final String description;
  final List<LessonSectionBridge> sections;
  final String difficulty;
  final int durationMinutes;
  final IconDataBridge icon;
  final bool isCompleted;

  LessonBridge({
    required this.id,
    required this.title,
    required this.description,
    required this.difficulty,
    required this.durationMinutes,
    required this.icon,
    this.sections = const [],
    this.isCompleted = false,
  });
}

class LessonSectionBridge {
  final String content;
  final String? codeExample;
  final List<ExerciseBridge> exercises;

  LessonSectionBridge({
    required this.content,
    this.codeExample,
    required this.exercises,
  });
}

@Bind()
class ExerciseBridge {
  final String question;
  final String initialCode;
  // final Future<bool> Function(JavascriptRuntimeWrapper, String code)? validator;
  final $Function? validator;
  final bool isCompleted;

  ExerciseBridge({
    required this.question,
    required this.initialCode,
    this.validator,
    this.isCompleted = false,
  });
}

class JavascriptRuntimeWrapper {
  const JavascriptRuntimeWrapper();

  void evaluate(String code) {}
}

Lesson lessonFromWrapper(LessonBridge wrapper) {
  return Lesson(
    id: wrapper.id,
    title: wrapper.title,
    description: wrapper.description,
    sections: wrapper.sections.map(sectionFromWrapper).toList(),
    difficulty: wrapper.difficulty,
    durationMinutes: wrapper.durationMinutes,
    icon: IconData(
      wrapper.icon.codePoint,
      fontFamily: wrapper.icon.fontFamily,
      fontPackage: wrapper.icon.fontPackage,
    ),
    isCompleted: wrapper.isCompleted,
  );
}

LessonSection sectionFromWrapper(LessonSectionBridge wrapper) {
  return LessonSection(
    content: wrapper.content,
    codeExample: wrapper.codeExample,
    exercises: wrapper.exercises.map(exerciseFromWrapper).toList(),
  );
}

Exercise exerciseFromWrapper(ExerciseBridge wrapper) {
  return Exercise(
    question: wrapper.question,
    initialCode: wrapper.initialCode,
    validator: null,
    isCompleted: wrapper.isCompleted,
    validate: '',
  );
}
