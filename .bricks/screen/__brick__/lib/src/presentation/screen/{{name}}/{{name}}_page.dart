import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '{{name}}_view_model.dart';

class {{name.pascalCase()}}Page extends ConsumerWidget {
  const {{name.pascalCase()}}Page({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read({{name.camelCase()}}ViewModelProvider);
    // TODO: Implement your page UI here
    return Scaffold();
  }
}
