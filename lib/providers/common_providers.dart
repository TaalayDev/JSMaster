import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data.dart';

final localStorageProvider = Provider((ref) => LocalStorage());
final dioProvider = Provider((ref) => Dio());
