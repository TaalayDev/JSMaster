import 'package:code_text_field/code_text_field.dart';
import 'package:dart_eval/stdlib/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eval/flutter_eval.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:highlight/languages/dart.dart';

import '../widgets/dart_editor.dart';

const example = '''
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'The name is',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
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
''';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen>
    with SingleTickerProviderStateMixin {
  late CodeController _codeController;
  late TabController _tabController;
  String code = example;

  @override
  void initState() {
    _codeController = CodeController(
      text: example,
      language: dart,
    );

    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              // Tablet and Desktop layout
              return Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: _buildCodeEditor(),
                  ),
                  const VerticalDivider(width: 1),
                  Expanded(
                    flex: 2,
                    child: _buildPreview(),
                  ),
                ],
              );
            } else {
              // Mobile layout
              return Column(
                children: [
                  TabBar(
                    controller: _tabController,
                    tabs: const [
                      Tab(icon: Icon(Feather.code), text: 'Code'),
                      Tab(icon: Icon(Feather.smartphone), text: 'Preview'),
                    ],
                    labelColor: Theme.of(context).colorScheme.primary,
                    unselectedLabelColor: Theme.of(context).hintColor,
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        _buildCodeEditor(),
                        _buildPreview(),
                      ],
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildCodeEditor() {
    return Stack(
      children: [
        Positioned.fill(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: DartEditor(controller: _codeController),
          ),
        ),
        Positioned(
          right: 16,
          bottom: 16,
          child: FloatingActionButton(
            onPressed: () {
              setState(() {
                code = _codeController.text;
              });
              if (MediaQuery.sizeOf(context).width < 600) {
                _tabController.animateTo(1);
              }
            },
            tooltip: 'Run code',
            child: const Icon(Feather.play),
          ),
        ),
      ],
    );
  }

  Widget _buildPreview() {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 600),
        child: FlutterWidget(code: code),
      ),
    );
  }

  @override
  void dispose() {
    _codeController.dispose();
    _tabController.dispose();
    super.dispose();
  }
}

class FlutterWidget extends StatelessWidget {
  const FlutterWidget({
    super.key,
    required this.code,
  });

  final String code;

  @override
  Widget build(BuildContext context) {
    return EvalWidget(
      packages: {
        'example': {'main.dart': code},
      },
      assetPath: 'assets/program.evc',
      library: 'package:example/main.dart',
      function: 'MyApp.',
      args: [null],
    );
  }
}
