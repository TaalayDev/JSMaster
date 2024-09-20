import 'package:dart_eval/dart_eval.dart';
import 'package:dart_eval/dart_eval_bridge.dart';
import 'package:dart_eval/stdlib/core.dart';
import 'package:dart_eval/stdlib/async.dart';

import '../../core/compiler/bridges.dart';
import 'lesson_model.dart';

/// dart_eval wrapper binding for [LessonBridge]
class $Lesson implements $Instance {
  /// Configure this class for use in a [Runtime]
  static void configureForRuntime(Runtime runtime) {
    runtime.registerBridgeFunc('package:jsmaster/data/models/lesson_model.dart',
        'Lesson.', $Lesson.$new);
  }

  /// Compile-time type declaration of [$LessonBridge]
  static const $type = BridgeTypeRef(
    BridgeTypeSpec(
      'package:jsmaster/data/models/lesson_model.dart',
      'Lesson',
    ),
  );

  /// Compile-time class declaration of [$LessonBridge]
  static const $declaration = BridgeClassDef(
    BridgeClassType(
      $type,
      isAbstract: false,
    ),
    constructors: {
      '': BridgeConstructorDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation($type),
          namedParams: [
            BridgeParameter(
              'id',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              true,
            ),
            BridgeParameter(
              'title',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              true,
            ),
            BridgeParameter(
              'description',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              true,
            ),
            BridgeParameter(
              'difficulty',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              true,
            ),
            BridgeParameter(
              'durationMinutes',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.int)),
              true,
            ),
            BridgeParameter(
              'icon',
              BridgeTypeAnnotation(BridgeTypeRef(
                  BridgeTypeSpec('package:flutter/material.dart', 'IconData'))),
              true,
            ),
            BridgeParameter(
              'sections',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.list)),
              false,
            ),
            BridgeParameter(
              'isCompleted',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.bool)),
              false,
            ),
          ],
          params: [],
        ),
        isFactory: false,
      ),
    },
    methods: {},
    getters: {},
    setters: {},
    fields: {
      'id': BridgeFieldDef(
        BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
        isStatic: false,
      ),
      'title': BridgeFieldDef(
        BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
        isStatic: false,
      ),
      'description': BridgeFieldDef(
        BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
        isStatic: false,
      ),
      'sections': BridgeFieldDef(
        BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.list)),
        isStatic: false,
      ),
      'difficulty': BridgeFieldDef(
        BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
        isStatic: false,
      ),
      'durationMinutes': BridgeFieldDef(
        BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.int)),
        isStatic: false,
      ),
      'icon': BridgeFieldDef(
        BridgeTypeAnnotation(BridgeTypeRef(
            BridgeTypeSpec('package:flutter/material.dart', 'IconData'))),
        isStatic: false,
      ),
      'isCompleted': BridgeFieldDef(
        BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.bool)),
        isStatic: false,
      ),
    },
    wrap: true,
  );

  /// Wrapper for the [LessonBridge.new] constructor
  static $Value? $new(Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $Lesson.wrap(
      Lesson(
          id: args[0]!.$value,
          title: args[1]!.$value,
          description: args[2]!.$value,
          difficulty: args[3]!.$value,
          durationMinutes: args[4]!.$value,
          icon: args[5]!.$value,
          sections: args[6]?.$value ?? const [],
          isCompleted: args[7]?.$value ?? false),
    );
  }

  final $Instance _superclass;

  @override
  final Lesson $value;

  @override
  Lesson get $reified => $value;

  /// Wrap a [LessonBridge] in a [$LessonBridge]
  $Lesson.wrap(this.$value) : _superclass = $Object($value);

  @override
  int $getRuntimeType(Runtime runtime) => runtime.lookupType($type.spec!);

  @override
  $Value? $getProperty(Runtime runtime, String identifier) {
    switch (identifier) {
      case 'id':
        final _id = $value.id;
        return $String(_id);

      case 'title':
        final _title = $value.title;
        return $String(_title);

      case 'description':
        final _description = $value.description;
        return $String(_description);

      case 'sections':
        final _sections = $value.sections;
        return $List.view(_sections, (e) => $LessonSection.wrap(e));

      case 'difficulty':
        final _difficulty = $value.difficulty;
        return $String(_difficulty);

      case 'durationMinutes':
        final _durationMinutes = $value.durationMinutes;
        return $int(_durationMinutes);

      case 'icon':
        final _icon = $value.icon;
        return $IconData.wrap(_icon);

      case 'isCompleted':
        final _isCompleted = $value.isCompleted;
        return $bool(_isCompleted);
    }
    return _superclass.$getProperty(runtime, identifier);
  }

  @override
  void $setProperty(Runtime runtime, String identifier, $Value value) {
    return _superclass.$setProperty(runtime, identifier, value);
  }
}

/// dart_eval wrapper binding for [LessonSectionBridge]
class $LessonSection implements $Instance {
  /// Configure this class for use in a [Runtime]
  static void configureForRuntime(Runtime runtime) {
    runtime.registerBridgeFunc('package:jsmaster/data/models/lesson_model.dart',
        'LessonSection.', $LessonSection.$new);
  }

  /// Compile-time type declaration of [$LessonSectionBridge]
  static const $type = BridgeTypeRef(
    BridgeTypeSpec(
      'package:jsmaster/data/models/lesson_model.dart',
      'LessonSection',
    ),
  );

  /// Compile-time class declaration of [$LessonSectionBridge]
  static const $declaration = BridgeClassDef(
    BridgeClassType(
      $type,
      isAbstract: false,
    ),
    constructors: {
      '': BridgeConstructorDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation($type),
          namedParams: [
            BridgeParameter(
              'content',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              true,
            ),
            BridgeParameter(
              'codeExample',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              true,
            ),
            BridgeParameter(
              'exercises',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.list)),
              true,
            ),
          ],
          params: [],
        ),
        isFactory: false,
      ),
    },
    methods: {},
    getters: {},
    setters: {},
    fields: {
      'content': BridgeFieldDef(
        BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
        isStatic: false,
      ),
      'codeExample': BridgeFieldDef(
        BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
        isStatic: false,
      ),
      'exercises': BridgeFieldDef(
        BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.list)),
        isStatic: false,
      ),
    },
    wrap: true,
  );

  /// Wrapper for the [LessonSectionBridge.new] constructor
  static $Value? $new(Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $LessonSection.wrap(
      LessonSection(
        content: args[0]!.$value,
        codeExample: args[1]?.$value,
        exercises: args[2]?.$value,
      ),
    );
  }

  final $Instance _superclass;

  @override
  final LessonSection $value;

  @override
  LessonSection get $reified => $value;

  /// Wrap a [LessonSectionBridge] in a [$LessonSectionBridge]
  $LessonSection.wrap(this.$value) : _superclass = $Object($value);

  @override
  int $getRuntimeType(Runtime runtime) => runtime.lookupType($type.spec!);

  @override
  $Value? $getProperty(Runtime runtime, String identifier) {
    switch (identifier) {
      case 'content':
        final _content = $value.content;
        return $String(_content);

      case 'codeExample':
        final _codeExample = $value.codeExample;
        return _codeExample == null ? $null() : $String(_codeExample);

      case 'exercises':
        final _exercises = $value.exercises;
        return $List.view(_exercises, (e) => $Exercise.wrap(e));
    }
    return _superclass.$getProperty(runtime, identifier);
  }

  @override
  void $setProperty(Runtime runtime, String identifier, $Value value) {
    return _superclass.$setProperty(runtime, identifier, value);
  }
}

/// dart_eval wrapper binding for [ExerciseBridge]
class $Exercise implements $Instance {
  /// Configure this class for use in a [Runtime]
  static void configureForRuntime(Runtime runtime) {
    runtime.registerBridgeFunc('package:jsmaster/data/models/lesson_model.dart',
        'Exercise.', $Exercise.$new);
  }

  /// Compile-time type declaration of [$ExerciseBridge]
  static const $type = BridgeTypeRef(
    BridgeTypeSpec(
      'package:jsmaster/data/models/lesson_model.dart',
      'Exercise',
    ),
  );

  /// Compile-time class declaration of [$ExerciseBridge]
  static const $declaration = BridgeClassDef(
    BridgeClassType(
      $type,
      isAbstract: false,
    ),
    constructors: {
      '': BridgeConstructorDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation($type),
          namedParams: [
            BridgeParameter(
              'question',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              true,
            ),
            BridgeParameter(
              'initialCode',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              true,
            ),
            BridgeParameter(
              'validator',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.function)),
              true,
            ),
            BridgeParameter(
              'isCompleted',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.bool)),
              false,
            ),
          ],
          params: [],
        ),
        isFactory: false,
      ),
    },
    methods: {},
    getters: {},
    setters: {},
    fields: {
      'question': BridgeFieldDef(
        BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
        isStatic: false,
      ),
      'initialCode': BridgeFieldDef(
        BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
        isStatic: false,
      ),
      'validator': BridgeFieldDef(
        BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.function)),
        isStatic: false,
      ),
      'isCompleted': BridgeFieldDef(
        BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.bool)),
        isStatic: false,
      ),
    },
    wrap: true,
  );

  /// Wrapper for the [ExerciseBridge.new] constructor
  static $Value? $new(Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $Exercise.wrap(
      Exercise(
        question: args[0]!.$value,
        initialCode: args[1]!.$value,
        validator: args[2]?.$value,
        isCompleted: args[3]?.$value ?? false,
        validate: '',
      ),
    );
  }

  final $Instance _superclass;

  @override
  final Exercise $value;

  @override
  Exercise get $reified => $value;

  /// Wrap a [ExerciseBridge] in a [$ExerciseBridge]
  $Exercise.wrap(this.$value) : _superclass = $Object($value);

  @override
  int $getRuntimeType(Runtime runtime) => runtime.lookupType($type.spec!);

  @override
  $Value? $getProperty(Runtime runtime, String identifier) {
    switch (identifier) {
      case 'question':
        final _question = $value.question;
        return $String(_question);

      case 'initialCode':
        final _initialCode = $value.initialCode;
        return $String(_initialCode);

      case 'validator':
        final _validator = $value.validator;
        return _validator == null
            ? $null()
            : $Function((runtime, target, args) {
                final funcResult = _validator(args[0]!.$value, args[1]!.$value);
                return $Future.wrap(funcResult);
              });

      case 'isCompleted':
        final _isCompleted = $value.isCompleted;
        return $bool(_isCompleted);
    }
    return _superclass.$getProperty(runtime, identifier);
  }

  @override
  void $setProperty(Runtime runtime, String identifier, $Value value) {
    return _superclass.$setProperty(runtime, identifier, value);
  }
}
