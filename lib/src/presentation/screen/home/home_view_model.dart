import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/utilities/log_utils.dart';
import '../../../domain/entity/wine_type.dart';
import '../../../domain/usecase/usecase.dart';
import '../../../domain/usecase/wine/search_wine_usecase.dart';
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

  SearchWineUsecase get _searchWineUsecase =>
      ref.read(searchWineUsecaseProvider);

  Future<void> fetchWines({WineType? type}) async {
    try {
      final wines = await _searchWineUsecase(type: type ?? state.wineType);
      state = state.copyWith(wines: wines, isLoading: false);
    } on Exception catch (e, stackTrace) {
      logError(e, stackTrace: stackTrace);
    }
  }

  void setWineType(WineType type) {
    state = state.copyWith(wineType: type);
  }
}
