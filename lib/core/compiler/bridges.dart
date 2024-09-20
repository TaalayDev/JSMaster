import 'package:dart_eval/dart_eval.dart';
import 'package:dart_eval/dart_eval_bridge.dart';
import 'package:dart_eval/stdlib/core.dart';
import 'package:dart_eval/stdlib/async.dart';
import 'package:flutter/material.dart';

/// dart_eval wrapper binding for [IconData]
class $IconData implements $Instance {
  /// Configure this class for use in a [Runtime]
  static void configureForRuntime(Runtime runtime) {
    runtime.registerBridgeFunc(
        'package:flutter/material.dart', 'IconData.', $IconData.$new);
  }

  /// Compile-time type declaration of [$IconData]
  static const $type = BridgeTypeRef(
    BridgeTypeSpec(
      'package:flutter/material.dart',
      'IconData',
    ),
  );

  /// Compile-time class declaration of [$IconData]
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
          params: [
            BridgeParameter(
              'codePoint',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.int)),
              true,
            ),
            BridgeParameter(
              'fontFamily',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              true,
            ),
            BridgeParameter(
              'fontPackage',
              BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
              true,
            ),
          ],
        ),
        isFactory: false,
      ),
    },
    methods: {},
    getters: {},
    setters: {},
    fields: {
      'codePoint': BridgeFieldDef(
        BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.int)),
        isStatic: false,
      ),
      'fontFamily': BridgeFieldDef(
        BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
        isStatic: false,
      ),
      'fontPackage': BridgeFieldDef(
        BridgeTypeAnnotation(BridgeTypeRef(CoreTypes.string)),
        isStatic: false,
      ),
    },
    wrap: true,
  );

  /// Wrapper for the [IconData.new] constructor
  static $Value? $new(Runtime runtime, $Value? thisValue, List<$Value?> args) {
    return $IconData.wrap(
      IconData(args[0]!.$value,
          fontFamily: args[1]?.$value, fontPackage: args[2]?.$value),
    );
  }

  final $Instance _superclass;

  @override
  final IconData $value;

  @override
  IconData get $reified => $value;

  /// Wrap a [IconData] in a [$IconData]
  $IconData.wrap(this.$value) : _superclass = $Object($value);

  @override
  int $getRuntimeType(Runtime runtime) => runtime.lookupType($type.spec!);

  @override
  $Value? $getProperty(Runtime runtime, String identifier) {
    switch (identifier) {
      case 'codePoint':
        final _codePoint = $value.codePoint;
        return $int(_codePoint);

      case 'fontFamily':
        final _fontFamily = $value.fontFamily;
        return _fontFamily != null ? $String(_fontFamily) : null;

      case 'fontPackage':
        final _fontPackage = $value.fontPackage;
        return _fontPackage != null ? $String(_fontPackage!) : null;
    }
    return _superclass.$getProperty(runtime, identifier);
  }

  @override
  void $setProperty(Runtime runtime, String identifier, $Value value) {
    return _superclass.$setProperty(runtime, identifier, value);
  }
}
