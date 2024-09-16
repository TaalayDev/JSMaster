import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_js/flutter_js.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:highlight/languages/javascript.dart';

import '../../core/compiler/themes.dart';

class JSEditor extends StatefulWidget {
  const JSEditor({
    super.key,
    this.initialCode,
    this.onCodeChanged,
  });

  final String? initialCode;
  final void Function(String)? onCodeChanged;

  @override
  _JSEditorState createState() => _JSEditorState();
}

class _JSEditorState extends State<JSEditor> {
  late CodeController _codeController;
  late Map<String, TextStyle> _theme = EDITOR_THEMES['gradient-dark'] ?? {};

  @override
  void initState() {
    final source = widget.initialCode ?? "// Write your JavaScript code here";
    _codeController = CodeController(
      text: source,
      language: javascript,
    );
    super.initState();
  }

  @override
  void didUpdateWidget(covariant JSEditor oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialCode != widget.initialCode) {
      _codeController = CodeController(
        text: widget.initialCode ?? "// Write your JavaScript code here",
        language: javascript,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = CodeThemeData(styles: _theme);
    return CodeTheme(
      data: theme,
      child: CodeField(
        controller: _codeController,
        textStyle: GoogleFonts.firaCode(fontSize: 14),
        onChanged: widget.onCodeChanged,
      ),
    );
  }
}
