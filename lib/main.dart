import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/presentation/screen/app/app.dart';

Future<void> main() async {
  runApp(const ProviderScope(child: App()));
}
