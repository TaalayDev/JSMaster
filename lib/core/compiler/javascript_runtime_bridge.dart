import 'package:dart_eval/dart_eval.dart';
import 'package:dart_eval/dart_eval_bridge.dart';
import 'package:dart_eval/stdlib/core.dart';
import 'package:dart_eval/stdlib/async.dart';
import 'package:flutter_js/flutter_js.dart';

/// dart_eval wrapper binding for [JavascriptRuntimeWrapper]
class $JavascriptRuntime implements $Instance {
  /// Configure this class for use in a [Runtime]
  static void configureForRuntime(Runtime runtime) {
    runtime.registerBridgeFunc(
      'package:flutter_js/flutter_js.dart',
      'JavascriptRuntime.',
      $JavascriptRuntime.$new,
    );
  }

  /// Compile-time type declaration of [$JavascriptRuntimeWrapper]
  static const $type = BridgeTypeRef(
    BridgeTypeSpec(
      'package:flutter_js/flutter_js.dart',
      'JavascriptRuntime',
    ),
  );

  /// Compile-time class declaration of [$JavascriptRuntimeWrapper]
  static const $declaration = BridgeClassDef(
    BridgeClassType(
      $type,
      isAbstract: false,
    ),
    constructors: {
      '': BridgeConstructorDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation($type),
          namedParams: [],
          params: [],
        ),
        isFactory: false,
      ),
    },
    methods: {
      'evaluate': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(
            BridgeTypeRef(BridgeTypeSpec(
              'package:flutter_js/flutter_js.dart',
              'JsEvalResult',
            )),
          ),
          namedParams: [],
          params: [
            BridgeParameter(
              'code',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              true,
            ),
          ],
        ),
      ),
    },
    getters: {},
    setters: {},
    fields: {},
    wrap: true,
  );

  /// Wrapper for the [JavascriptRuntimeWrapper.new] constructor
  static $Value? $new(Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $JavascriptRuntime.wrap(
      getJavascriptRuntime(),
    );
  }

  final $Instance _superclass;

  @override
  final JavascriptRuntime $value;

  @override
  JavascriptRuntime get $reified => $value;

  /// Wrap a [JavascriptRuntimeWrapper] in a [$JavascriptRuntimeWrapper]
  $JavascriptRuntime.wrap(this.$value) : _superclass = $Object($value);

  @override
  int $getRuntimeType(Runtime runtime) => runtime.lookupType($type.spec!);

  @override
  $Value? $getProperty(Runtime runtime, String identifier) {
    switch (identifier) {
      case 'evaluate':
        return __evaluate;
    }
    return _superclass.$getProperty(runtime, identifier);
  }

  static const $Function __evaluate = $Function(_evaluate);
  static $Value? _evaluate(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $JavascriptRuntime;
    self.$value.evaluate(args[0]!.$value);
    return null;
  }

  @override
  void $setProperty(Runtime runtime, String identifier, $Value value) {
    return _superclass.$setProperty(runtime, identifier, value);
  }
}

/// dart_eval wrapper binding for [JsEvalResult]
class $JsEvalResult implements $Instance {
  /// Configure this class for use in a [Runtime]
  static void configureForRuntime(Runtime runtime) {
    runtime.registerBridgeFunc('package:flutter_js/flutter_js.dart',
        'JsEvalResult.', $JsEvalResult.$new);
  }

  /// Compile-time type declaration of [$JsEvalResult]
  static const $type = BridgeTypeRef(
    BridgeTypeSpec(
      'package:flutter_js/flutter_js.dart',
      'JsEvalResult',
    ),
  );

  /// Compile-time class declaration of [$JsEvalResult]
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
              'isError',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.bool)),
              false,
            ),
            BridgeParameter(
              'isPromise',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.bool)),
              false,
            ),
          ],
          params: [
            BridgeParameter(
              'stringResult',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              true,
            ),
            BridgeParameter(
              'rawResult',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.dynamic)),
              true,
            ),
          ],
        ),
        isFactory: false,
      ),
    },
    methods: {
      'toString': BridgeMethodDef(
        BridgeFunctionDef(
          returns: BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
          namedParams: [],
          params: [],
        ),
      ),
    },
    getters: {},
    setters: {},
    fields: {
      'stringResult': BridgeFieldDef(
        BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
        isStatic: false,
      ),
      'rawResult': BridgeFieldDef(
        BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.dynamic)),
        isStatic: false,
      ),
      'isPromise': BridgeFieldDef(
        BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.bool)),
        isStatic: false,
      ),
      'isError': BridgeFieldDef(
        BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.bool)),
        isStatic: false,
      ),
    },
    wrap: true,
  );

  /// Wrapper for the [JsEvalResult.new] constructor
  static $Value? $new(Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $JsEvalResult.wrap(
      JsEvalResult(args[0]!.$value, args[1]!.$value,
          isError: args[2]?.$value ?? false,
          isPromise: args[3]?.$value ?? false),
    );
  }

  final $Instance _superclass;

  @override
  final JsEvalResult $value;

  @override
  JsEvalResult get $reified => $value;

  /// Wrap a [JsEvalResult] in a [$JsEvalResult]
  $JsEvalResult.wrap(this.$value) : _superclass = $Object($value);

  @override
  int $getRuntimeType(Runtime runtime) => runtime.lookupType($type.spec!);

  @override
  $Value? $getProperty(Runtime runtime, String identifier) {
    switch (identifier) {
      case 'stringResult':
        final _stringResult = $value.stringResult;
        return $String(_stringResult);

      case 'rawResult':
        final _rawResult = $value.rawResult;
        return $Object(_rawResult);

      case 'isPromise':
        final _isPromise = $value.isPromise;
        return $bool(_isPromise);

      case 'isError':
        final _isError = $value.isError;
        return $bool(_isError);
      case 'toString':
        return __toString;
    }
    return _superclass.$getProperty(runtime, identifier);
  }

  static const $Function __toString = $Function(_toString);
  static $Value? _toString(
      Runtime runtime, $Value? target, List<$Value?> args) {
    final self = target as $JsEvalResult;
    final result = self.$value.toString();
    return $String(result);
  }

  @override
  void $setProperty(Runtime runtime, String identifier, $Value value) {
    return _superclass.$setProperty(runtime, identifier, value);
  }
}
