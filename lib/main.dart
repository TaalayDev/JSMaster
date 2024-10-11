import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app/app.dart';
import 'core.dart';
import 'data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.init();

  setupLogger();
  _test();

  runApp(const ProviderScope(child: App()));
}

void _test() {
  final quizzes = quizzesList.map((quiz) {
    return quiz.toMap();
  }).toList();
  final quizzesJson = jsonEncode(quizzes);

  Clipboard.setData(ClipboardData(text: quizzesJson));
}
