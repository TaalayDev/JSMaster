import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data.dart';
import 'common_providers.dart';

part 'lessons_provider.g.dart';

@riverpod
class Lessons extends _$Lessons {
  LocalStorage get storage => ref.read(localStorageProvider);

  @override
  List<Lesson> build() {
    final completedLessons = storage.completedLessons;
    final lessonsList = ref.watch(lessonsCacheProvider).valueOrNull?.lessons ??
        const <Lesson>[];
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

class LessonsCacheState {
  final bool hasCache;
  final bool isReady;
  final bool isLoading;
  final Object? error;
  final List<Lesson> lessons;
  final List<Quiz> quizzes;

  const LessonsCacheState({
    this.hasCache = false,
    this.isReady = false,
    this.isLoading = false,
    this.error,
    this.lessons = const [],
    this.quizzes = const [],
  });

  LessonsCacheState copyWith({
    bool? hasCache,
    bool? isReady,
    bool? isLoading,
    Object? error,
    List<Lesson>? lessons,
    List<Quiz>? quizzes,
  }) {
    return LessonsCacheState(
      hasCache: hasCache ?? this.hasCache,
      isReady: isReady ?? this.isReady,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      lessons: lessons ?? this.lessons,
      quizzes: quizzes ?? this.quizzes,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LessonsCacheState &&
        other.hasCache == hasCache &&
        other.isReady == isReady &&
        other.isLoading == isLoading &&
        other.error == error &&
        listEquals(other.lessons, lessons) &&
        listEquals(other.quizzes, quizzes);
  }

  @override
  int get hashCode {
    return hasCache.hashCode ^
        isReady.hashCode ^
        isLoading.hashCode ^
        error.hashCode ^
        lessons.hashCode ^
        quizzes.hashCode;
  }
}

@riverpod
class LessonsCache extends _$LessonsCache {
  static const lessonsUrl =
      'https://raw.githubusercontent.com/TaalayDev/JSMaster/main/assets/json/lessons.json';
  static const quizzesUrl =
      'https://raw.githubusercontent.com/TaalayDev/JSMaster/main/assets/json/quizzes.json';
  static const cacheFile = 'lessons_and_quizzes.json';

  @override
  Future<LessonsCacheState> build() async {
    final file = await _getCacheFile(cacheFile);
    final hasCache = await file.exists();
    fetchLessonsAndQuizzes();

    if (!hasCache) {
      return const LessonsCacheState(isLoading: true);
    }

    final cache = await _readCache(file);
    return LessonsCacheState(
      isLoading: !hasCache,
      hasCache: hasCache,
      isReady: true,
      lessons: cache.lessons,
      quizzes: cache.quizzes,
    );
  }

  Future<File> _getCacheFile(String fileName) async {
    final appDocDir = await getApplicationDocumentsDirectory();
    return File('${appDocDir.path}/$fileName');
  }

  Future<({List<Lesson> lessons, List<Quiz> quizzes})> _readCache(
    File file,
  ) async {
    final json = await file.readAsString();
    final data = jsonDecode(json) as Map<String, dynamic>;

    final lessons = (data['lessons'] as List)
        .map((json) => _jsonToLesson(json as Map<String, dynamic>))
        .toList();
    final quizzes = (data['quizzes'] as List)
        .map((json) => Quiz.fromMap(json as Map<String, dynamic>))
        .toList();

    return (lessons: lessons, quizzes: quizzes);
  }

  Future<void> fetchLessonsAndQuizzes() async {
    final lessons = await fetchLessons();
    final quizzes = await fetchQuizzes();

    final lessonsJson = lessons.map((l) => _lessonToJson(l)).toList();
    final quizzesJson = quizzes.map((q) => q.toMap()).toList();

    final file = await _getCacheFile(cacheFile);
    await file.writeAsString(
      jsonEncode({
        'lessons': lessonsJson,
        'quizzes': quizzesJson,
      }),
    );

    state = AsyncValue.data(LessonsCacheState(
      isReady: true,
      hasCache: true,
      lessons: lessons,
      quizzes: quizzes,
    ));
  }

  Future<List<Lesson>> fetchLessons() async {
    final dio = ref.read(dioProvider);

    final response = await dio.get(lessonsUrl);
    final data =
        response.data is List ? response.data : jsonDecode(response.data);
    final lessons = (data as List)
        .map((json) => _jsonToLesson(json as Map<String, dynamic>))
        .toList();

    return lessons;
  }

  Future<List<Quiz>> fetchQuizzes() async {
    final dio = ref.read(dioProvider);

    final response = await dio.get(quizzesUrl);
    final data =
        response.data is List ? response.data : jsonDecode(response.data);
    final quizzes = (data as List)
        .map((json) => Quiz.fromMap(json as Map<String, dynamic>))
        .toList();

    return quizzes;
  }

  Lesson _jsonToLesson(Map<String, dynamic> json) {
    return Lesson(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      difficulty: json['difficulty'] as String,
      durationMinutes: json['durationMinutes'] as int,
      icon: IconData(
        json['icon']['codePoint'] as int,
        fontFamily: json['icon']['fontFamily'] as String,
        fontPackage: json['icon']['fontPackage'] as String?,
        matchTextDirection:
            (json['icon']['matchTextDirection'] as bool?) ?? false,
        fontFamilyFallback: (json['icon']['fontFamilyFallback'] as List?)
            ?.map((e) => e as String)
            .toList(),
      ),
      sections: (json['sections'] as List)
          .map((section) =>
              _jsonToLessonSection(section as Map<String, dynamic>))
          .toList(),
    );
  }

  LessonSection _jsonToLessonSection(Map<String, dynamic> json) {
    return LessonSection(
      content: json['content'] as String,
      codeExample: json['codeExample'] as String?,
      exercises: (json['exercises'] as List)
          .map((exercise) => _jsonToExercise(exercise as Map<String, dynamic>))
          .toList(),
    );
  }

  Exercise _jsonToExercise(Map<String, dynamic> json) {
    return Exercise(
      question: json['question'] as String,
      initialCode: json['initialCode'] as String,
      isCompleted: (json['isCompleted'] as bool?) ?? false,
      validate: json['validate'] as String,
    );
  }

  Map<String, dynamic> _lessonToJson(Lesson lesson) {
    return {
      'id': lesson.id,
      'title': lesson.title,
      'description': lesson.description,
      'difficulty': lesson.difficulty,
      'durationMinutes': lesson.durationMinutes,
      'icon': {
        'codePoint': lesson.icon.codePoint,
        'fontFamily': lesson.icon.fontFamily,
        'fontPackage': lesson.icon.fontPackage,
        'matchTextDirection': lesson.icon.matchTextDirection,
        'fontFamilyFallback': lesson.icon.fontFamilyFallback,
      },
      'sections': lesson.sections.map(_lessonSectionToJson).toList(),
    };
  }

  Map<String, dynamic> _lessonSectionToJson(LessonSection section) {
    return {
      'content': section.content,
      'codeExample': section.codeExample,
      'exercises': section.exercises.map(_exerciseToJson).toList(),
    };
  }

  Map<String, dynamic> _exerciseToJson(Exercise exercise) {
    return {
      'question': exercise.question,
      'initialCode': exercise.initialCode,
      'isCompleted': exercise.isCompleted,
      'validate': exercise.validate,
    };
  }
}
