import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:dart_eval/dart_eval.dart';

import 'core/compiler/bridges.dart';
import 'core/compiler/javascript_runtime_bridge.dart';
import 'data/models/lesson_model.eval.dart';
import 'app/app.dart';
import 'core.dart';
import 'data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.init();

  setupLogger();

  // _runEval();

  runApp(const ProviderScope(child: App()));
}

void _runEval() {
  try {
    final compiler = Compiler();
    compiler.defineBridgeClass($Lesson.$declaration);
    compiler.defineBridgeClass($IconData.$declaration);
    compiler.defineBridgeClass($LessonSection.$declaration);
    compiler.defineBridgeClass($JavascriptRuntime.$declaration);
    compiler.defineBridgeClass($JsEvalResult.$declaration);
    compiler.defineBridgeClass($Exercise.$declaration);

    final program = compiler.compile({
      'jsmaster': {
        'main.dart': '''
      import 'package:flutter/material.dart';
      import 'package:flutter_js/flutter_js.dart';
      import 'data/models/lesson_model.dart';

      int main() {
        // Future<bool> validateExercise(JavascriptRuntime runtime, String code) async {
        //   runtime.evaluate(code);
        //   final JsEvalResult result = runtime.evaluate('consoleLog.join("n")');
        //   String output = result.stringResult;
        //   return true;
        // }

        final lesson = Lesson(
          id: '1',
          title: 'Introduction to JavaScript',
          description:
              'This lesson covers the basics of JavaScript, including syntax, variables, and data types, setting a foundation for deeper understanding.',
          difficulty: 'Beginner',
          durationMinutes: 15,
          icon: IconData(0xe88a, 'MaterialIcons', 'flutter_vector_icons')
        );

        final exercise = Exercise(
          question: 'Write a program that prints "Welcome to JavaScript" to the console.',
          initialCode: '// Write your code here',
          
        );

        print(Future);

        return 0;
      }
    '''
      }
    });

    final runtime = Runtime.ofProgram(program);
    // Register static methods and constructors with the runtime
    runtime.registerBridgeFunc(
      'package:jsmaster/data/models/lesson_model.dart',
      'Lesson.',
      $Lesson.$new,
    );

    runtime.registerBridgeFunc(
      'package:flutter/material.dart',
      'IconData.',
      $IconData.$new,
    );

    runtime.registerBridgeFunc(
      'package:jsmaster/data/models/lesson_model.dart',
      'LessonSection.',
      $LessonSection.$new,
    );

    runtime.registerBridgeFunc(
      'package:flutter_js/flutter_js.dart',
      'JavascriptRuntime.',
      $JavascriptRuntime.$new,
    );

    runtime.registerBridgeFunc(
      'package:flutter_js/flutter_js.dart',
      'JsEvalResult.',
      $JsEvalResult.$new,
    );

    runtime.registerBridgeFunc(
      'package:jsmaster/data/models/lesson_model.dart',
      'Exercise.',
      $Exercise.$new,
    );

    final res = runtime.executeLib('package:jsmaster/main.dart', 'main');
    print(res);
  } catch (e, s) {
    print(e);
    print(s);
  }
}
