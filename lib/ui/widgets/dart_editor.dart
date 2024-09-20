import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_js/flutter_js.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:highlight/languages/dart.dart';

import '../../core/compiler/themes.dart';

class DartEditor extends StatefulWidget {
  const DartEditor({
    super.key,
    this.controller,
  });

  final CodeController? controller;

  @override
  _DartEditorState createState() => _DartEditorState();
}

class _DartEditorState extends State<DartEditor> {
  late CodeController _codeController;
  late Map<String, TextStyle> _theme = EDITOR_THEMES['gradient-dark'] ?? {};

  @override
  void initState() {
    _codeController =
        widget.controller ?? CodeController(text: '', language: dart);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = CodeThemeData(styles: _theme);
    return CodeTheme(
      data: theme,
      child: CodeField(
        controller: _codeController,
        textStyle: GoogleFonts.firaCode(fontSize: 14),
      ),
    );
  }
}
