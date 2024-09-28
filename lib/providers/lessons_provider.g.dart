// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lessons_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$lessonsHash() => r'9335b9367368dd56c7758e1bfb6eb7169959b146';

/// See also [Lessons].
@ProviderFor(Lessons)
final lessonsProvider =
    AutoDisposeNotifierProvider<Lessons, List<Lesson>>.internal(
  Lessons.new,
  name: r'lessonsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$lessonsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Lessons = AutoDisposeNotifier<List<Lesson>>;
String _$lessonsCacheHash() => r'2869d7e57feb3d2767f2cf416bad7868d63b131f';

/// See also [LessonsCache].
@ProviderFor(LessonsCache)
final lessonsCacheProvider =
    AutoDisposeAsyncNotifierProvider<LessonsCache, LessonsCacheState>.internal(
  LessonsCache.new,
  name: r'lessonsCacheProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$lessonsCacheHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LessonsCache = AutoDisposeAsyncNotifier<LessonsCacheState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
