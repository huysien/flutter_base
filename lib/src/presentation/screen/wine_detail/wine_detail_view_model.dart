import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'wine_detail_state.dart';

part 'wine_detail_view_model.g.dart';

@riverpod
class WineDetailViewModel extends _$WineDetailViewModel {
  @override
  WineDetailState build() => const WineDetailState(isLoading: false);
}
