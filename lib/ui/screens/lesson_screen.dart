import 'package:flutter/material.dart';
import 'package:flutter_js/flutter_js.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core.dart';
import '../../data.dart';
import '../../providers/lessons_provider.dart';
import '../widgets.dart';

class LessonLayout extends StatelessWidget {
  final String lessonId;

  const LessonLayout({super.key, required this.lessonId});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return _MobileLessonLayout(initialLessonId: lessonId);
        } else {
          return _DesktopLessonLayout(initialLessonId: lessonId);
        }
      },
    );
  }
}

class _MobileLessonLayout extends StatelessWidget {
  final String? initialLessonId;

  const _MobileLessonLayout({super.key, this.initialLessonId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JS Master'),
      ),
      drawer: _LessonDrawer(
        currentLessonId: initialLessonId,
        onLessonSelected: (lessonId) {
          Navigator.pop(context); // Close the drawer
          // TODO: Implement navigation to selected lesson
        },
      ),
      body: initialLessonId != null
          ? LessonScreen(lessonId: initialLessonId!)
          : const Center(child: Text('Select a lesson to begin')),
    );
  }
}

class _DesktopLessonLayout extends StatefulWidget {
  final String? initialLessonId;

  const _DesktopLessonLayout({super.key, this.initialLessonId});

  @override
  _DesktopLessonLayoutState createState() => _DesktopLessonLayoutState();
}

class _DesktopLessonLayoutState extends State<_DesktopLessonLayout> {
  late String? _currentLessonId;

  @override
  void initState() {
    super.initState();
    _currentLessonId = widget.initialLessonId;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: 250,
            child: _LessonDrawer(
              currentLessonId: _currentLessonId,
              onLessonSelected: (lessonId) {
                setState(() {
                  _currentLessonId = lessonId;
                });
              },
            ),
          ),
          Expanded(
            child: _currentLessonId != null
                ? LessonScreen(lessonId: _currentLessonId!)
                : const Center(child: Text('Select a lesson to begin')),
          ),
        ],
      ),
    );
  }
}

class _LessonDrawer extends HookConsumerWidget {
  final String? currentLessonId;
  final Function(String) onLessonSelected;

  const _LessonDrawer({
    super.key,
    required this.currentLessonId,
    required this.onLessonSelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lessons = ref.watch(lessonsProvider);

    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            padding: const EdgeInsets.all(0),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      if (constraints.maxWidth < 600) {
                        return const SizedBox();
                      } else {
                        return IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(
                            Feather.arrow_left,
                            color: Colors.white,
                          ),
                        );
                      }
                    },
                  ),
                ),
                Center(
                  child: Text(
                    'JS Master',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: lessons.length,
              itemBuilder: (context, index) {
                final lesson = lessons[index];
                final isPreviousCompleted =
                    lessons.take(index).every((lesson) => lesson.isCompleted);

                return ListTile(
                  leading: Icon(lesson.icon),
                  title: Text(
                    lesson.title,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  subtitle: Text(
                    lesson.difficulty,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  selected: lesson.id == currentLessonId,
                  selectedTileColor:
                      Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  onTap: lesson.id != currentLessonId && isPreviousCompleted
                      ? () => onLessonSelected(lesson.id)
                      : null,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class LessonScreen extends HookConsumerWidget {
  final String lessonId;

  const LessonScreen({super.key, required this.lessonId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lessons = ref.watch(lessonsProvider);
    final lesson = lessons.firstWhere((l) => l.id == lessonId);

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return _MobileLessonContent(
              lesson: lesson,
              onLessonCompleted: lessons.last.id == lesson.id
                  ? null
                  : () => _navigateToNextLesson(context, lessons, lesson),
            );
          } else {
            return _DesktopLessonContent(
              lesson: lesson,
              onLessonCompleted: lessons.last.id == lesson.id
                  ? null
                  : () => _navigateToNextLesson(context, lessons, lesson),
            );
          }
        },
      ),
    );
  }

  void _navigateToNextLesson(
    BuildContext context,
    List<Lesson> lessons,
    Lesson lesson,
  ) {
    final index = lessons.indexOf(lesson);
    final nextLesson = lessons[index + 1];

    Navigator.pop(context);

    LessonRoute(id: nextLesson.id).push(context);
  }
}

class _MobileLessonContent extends StatelessWidget {
  final Lesson lesson;
  final Function()? onLessonCompleted;

  const _MobileLessonContent({
    super.key,
    required this.lesson,
    this.onLessonCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            tabs: const [
              Tab(icon: Icon(Feather.book), text: 'Lesson'),
              Tab(icon: Icon(Feather.code), text: 'Code'),
            ],
            labelColor: Theme.of(context).colorScheme.primary,
            unselectedLabelColor: Theme.of(context).hintColor,
          ),
          Expanded(
            child: TabBarView(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _LessonHeader(lesson: lesson),
                        const SizedBox(height: 16),
                        for (final section in lesson.sections) ...[
                          _LessonContent(lesson: section),
                          const SizedBox(height: 24),
                          _CodeExample(lesson: section),
                          for (final exercise in section.exercises) ...[
                            Consumer(builder: (context, ref, child) {
                              return _ExerciseWidget(
                                exercise: exercise,
                                onAnswered: (isCorrect) {
                                  if (!isCorrect) return;
                                  ref
                                      .read(lessonsProvider.notifier)
                                      .updateExerciseCompletion(
                                        lessonId: lesson.id,
                                        section: section,
                                        exercise: exercise,
                                      );
                                },
                              );
                            }),
                            const SizedBox(height: 24),
                          ],
                          if (section.exercises.isEmpty)
                            const SizedBox(height: 24),
                        ],
                        if (lesson.isCompleted && onLessonCompleted != null)
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              onPressed: onLessonCompleted,
                              child: const Text('Next Lesson'),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                const JavaScriptEditor(
                  initialCode: '// You can write your code and run it here',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DesktopLessonContent extends StatelessWidget {
  final Lesson lesson;
  final Function()? onLessonCompleted;

  const _DesktopLessonContent({
    super.key,
    required this.lesson,
    this.onLessonCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _LessonHeader(lesson: lesson),
                  const SizedBox(height: 24),
                  for (final section in lesson.sections) ...[
                    _LessonContent(lesson: section),
                    const SizedBox(height: 24),
                    _CodeExample(lesson: section),
                    const SizedBox(height: 24),
                    for (final exercise in section.exercises) ...[
                      Consumer(builder: (context, ref, child) {
                        return _ExerciseWidget(
                          exercise: exercise,
                          onAnswered: (isCorrect) {
                            if (!isCorrect) return;
                            ref
                                .read(lessonsProvider.notifier)
                                .updateExerciseCompletion(
                                  lessonId: lesson.id,
                                  section: section,
                                  exercise: exercise,
                                );
                          },
                        );
                      }),
                      const SizedBox(height: 24),
                    ],
                    if (section.exercises.isEmpty) const SizedBox(height: 24),
                  ],
                  if (lesson.isCompleted && onLessonCompleted != null)
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: onLessonCompleted,
                        child: const Text('Next Lesson'),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: Theme.of(context).dividerColor,
                ),
              ),
            ),
            child: const JavaScriptEditor(
              initialCode: '// You can write your code and run it here',
            ),
          ),
        ),
      ],
    );
  }
}

class _LessonHeader extends StatelessWidget {
  final Lesson lesson;

  const _LessonHeader({super.key, required this.lesson});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          lesson.title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Icon(Feather.book, size: 16, color: Theme.of(context).hintColor),
            const SizedBox(width: 8),
            Text(
              lesson.difficulty,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(width: 16),
            Icon(Feather.clock, size: 16, color: Theme.of(context).hintColor),
            const SizedBox(width: 8),
            Text(
              '${lesson.durationMinutes} min',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ],
    );
  }
}

class _LessonContent extends StatelessWidget {
  final LessonSection lesson;

  const _LessonContent({Key? key, required this.lesson}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      lesson.content,
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}

class _CodeExample extends StatelessWidget {
  final LessonSection lesson;

  const _CodeExample({super.key, required this.lesson});

  @override
  Widget build(BuildContext context) {
    final example = lesson.codeExample;
    if (example == null || example.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Example Code',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        HighlightView(
          example,
          language: 'javascript',
          theme: githubTheme,
          padding: const EdgeInsets.all(12),
          textStyle: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}

class _ExerciseWidget extends StatefulWidget {
  final Exercise exercise;
  final Function(bool)? onAnswered;

  const _ExerciseWidget({
    required this.exercise,
    this.onAnswered,
  });

  @override
  _ExerciseWidgetState createState() => _ExerciseWidgetState();
}

class _ExerciseWidgetState extends State<_ExerciseWidget> {
  late TextEditingController _codeController;
  bool _isCorrect = false;
  bool _hasSubmitted = false;
  String _feedback = '';

  late JavascriptRuntime _jsRuntime;

  @override
  void initState() {
    super.initState();
    _codeController = TextEditingController(text: widget.exercise.initialCode);
    _jsRuntime = getJavascriptRuntime();
    _setupConsoleCapture();
  }

  @override
  void dispose() {
    _codeController.dispose();
    _jsRuntime.dispose();
    super.dispose();
  }

  void _setupConsoleCapture() {
    _jsRuntime.evaluate('''
      var consoleLog = [];
      console.log = function() {
        consoleLog.push(Array.prototype.slice.call(arguments).join(' '));
      };
    ''');
  }

  void _setLocalStorage() {
    _jsRuntime.evaluate('''
      var localStorage = {};
      localStorage.setItem = function(key, value) {
        localStorage[key] = value
      };
      localStorage.getItem = function(key) {
        return localStorage[key];
      };
    ''');
  }

  String validator(String code, String check) => '''
    $code

    $check
  ''';

  Future<void> _checkAnswer() async {
    setState(() {
      _hasSubmitted = true;
      _isCorrect = false;
      _feedback = '';
    });

    _jsRuntime = getJavascriptRuntime();
    _setupConsoleCapture();
    _setLocalStorage();

    try {
      // Run the user's code
      final code = _codeController.text
          .replaceAll('“', '"')
          .replaceAll('”', '"')
          .replaceAll('‘', "'")
          .replaceAll('’', "'");

      final validator = '''
        $code
        let code = "${_cleanupCode(code)}";
        ${widget.exercise.validate}
      ''';
      final eval = _jsRuntime.evaluate(validator);
      if (eval.isError) {
        throw Exception(eval.stringResult);
      }

      final result = _jsRuntime.evaluate('isValid').stringResult;
      final isValid = result == 'true';

      setState(() {
        _isCorrect = isValid;
        _feedback = isValid ? 'Correct!' : 'Incorrect. Try again.';
      });

      widget.onAnswered?.call(_isCorrect);
    } catch (e) {
      setState(() {
        _isCorrect = false;
        _feedback = 'Error in your code: ${e.toString()}';
      });
    }
  }

  String _cleanupCode(String code) {
    return code
        .replaceAll("'", "\\'")
        .replaceAll('"', '\\"')
        .replaceAll('\n', '\\n')
        .replaceAll('\t', '\\t')
        .replaceAll('\r', '\\r')
        .replaceAll('\f', '\\f')
        .replaceAll('\b', '\\b');
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Exercise:',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              widget.exercise.question,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            JSEditor(
              initialCode: widget.exercise.initialCode,
              onCodeChanged: (code) {
                _codeController.text = code;
                setState(() {
                  _hasSubmitted = false;
                });
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _checkAnswer,
              child: const Text('Check Answer'),
            ),
            if (_hasSubmitted)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  _feedback,
                  style: TextStyle(
                    color: _isCorrect ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
