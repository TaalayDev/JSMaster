import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_js/flutter_js.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:highlight/languages/javascript.dart';

import '../../core/compiler/themes.dart';

class JavaScriptEditor extends StatefulWidget {
  const JavaScriptEditor({
    super.key,
    this.initialCode,
  });

  final String? initialCode;

  @override
  _JavaScriptEditorState createState() => _JavaScriptEditorState();
}

class _JavaScriptEditorState extends State<JavaScriptEditor> {
  late CodeController _codeController;
  late JavascriptRuntime _jsRuntime;
  late Map<String, TextStyle> _theme = EDITOR_THEMES['gradient-dark'] ?? {};

  double _resultPanelHeight = 150;

  String _output = '';

  @override
  void initState() {
    final source = widget.initialCode ?? "// Write your JavaScript code here";
    _codeController = CodeController(
      text: source,
      language: javascript,
    );
    _jsRuntime = getJavascriptRuntime();
    _setupConsoleCapture();
    super.initState();
  }

  void _setupConsoleCapture() {
    _jsRuntime.evaluate('''
      var consoleLog = [];
      console.log = function() {
        consoleLog.push(Array.prototype.slice.call(arguments).join(' '));
      };
    ''');
  }

  void _runCode() {
    _jsRuntime = getJavascriptRuntime();
    _setupConsoleCapture();

    setState(() {
      _output = '';
    });

    _jsRuntime.evaluate('consoleLog = []');

    final code = _codeController.text;
    final result = _jsRuntime.evaluate(code).stringResult;
    final consoleResult = _jsRuntime.evaluate('consoleLog.join("\\n")');

    final r = result != "undefined" ? result : "";
    setState(() {
      _output =
          r.isNotEmpty ? '$r\n$consoleResult' : consoleResult.stringResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = CodeThemeData(styles: _theme);
    return Scaffold(
      floatingActionButton: FloatingActionButton.small(
        onPressed: _runCode,
        child: const Icon(Feather.play),
      ),
      body: Column(
        children: [
          Expanded(
            child: CodeTheme(
              data: theme,
              child: CodeField(
                controller: _codeController,
                textStyle: GoogleFonts.firaCode(fontSize: 14),
                expands: true,
              ),
            ),
          ),
          GestureDetector(
            onVerticalDragUpdate: (details) {
              setState(() {
                _resultPanelHeight -= details.primaryDelta!;
              });
            },
            child: const Divider(
              height: 1,
              thickness: 1,
              color: Colors.grey,
            ),
          ),
          Container(
            height: _resultPanelHeight,
            width: double.infinity,
            color: Colors.grey.shade900,
            padding: const EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Text(
                _output.isEmpty ? 'Output will appear here' : _output,
                style: GoogleFonts.firaCode(
                  fontSize: 14,
                  color: Colors.white.withOpacity(_output.isEmpty ? 0.2 : 1.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _jsRuntime.dispose();
    super.dispose();
  }
}
