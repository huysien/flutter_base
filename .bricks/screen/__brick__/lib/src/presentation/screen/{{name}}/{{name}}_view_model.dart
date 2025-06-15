import 'package:riverpod_annotation/riverpod_annotation.dart';

import '{{name}}_state.dart';

part '{{name}}_view_model.g.dart';

@riverpod
class {{name.pascalCase()}}ViewModel extends _${{name.pascalCase()}}ViewModel {
  @override
  {{name.pascalCase()}}State build() => const {{name.pascalCase()}}State(isLoading: false);
}
