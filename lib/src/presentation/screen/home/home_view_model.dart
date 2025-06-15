import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/utilities/log_utils.dart';
import '../../../domain/di/usecases.dart';
import '../../../domain/entity/wine_type.dart';
import 'home_state.dart';

part 'home_view_model.g.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {
  @override
  HomeState build() {
    final initState = HomeState(
      isLoading: true,
      wines: [],
      wineType: WineType.reds,
    );
    fetchWines(type: initState.wineType);
    return initState;
  }

  Future<void> fetchWines({WineType? type}) async {
    try {
      final wines = await ref.read(searchWineUsecaseProvider)(
          type: type ?? state.wineType);
      state = state.copyWith(wines: wines);
    } on Exception catch (e, stackTrace) {
      logError(e, stackTrace: stackTrace);
    }
  }

  void setWineType(WineType type) {
    state = state.copyWith(wineType: type);
  }
}
