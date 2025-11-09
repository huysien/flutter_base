import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/utilities/log_utils.dart';
import '../../../../domain/entity/wine.dart';
import '../../../../domain/usecase/usecase.dart';
import '../../../../domain/usecase/wine/favorite_wine_usecase.dart';
import '../../../../domain/usecase/wine/get_favorite_wines_usecase.dart';
import '../../../../domain/usecase/wine/unfavorite_wine_usecase.dart';
import 'favorite_wines_state.dart';

part 'favorite_wines_view_model.g.dart';

@riverpod
class FavoriteWinesViewModel extends _$FavoriteWinesViewModel {
  @override
  FavoriteWinesState build() {
    final initState = FavoriteWinesState(
      isLoading: true,
      wines: [],
    );
    fetchFavoriteWines();
    return initState;
  }

  GetFavoriteWinesUsecase get _getFavoriteWinesUsecase =>
      ref.read(getFavoriteWinesUsecaseProvider);
  FavoriteWineUsecase get _favoriteWineUsecase =>
      ref.read(favoriteWineUsecaseProvider);
  UnfavoriteWineUsecase get _unfavoriteWineUsecase =>
      ref.read(unfavoriteWineUsecaseProvider);

  Future<void> fetchFavoriteWines() async {
    try {
      final favoriteWines = await _getFavoriteWinesUsecase();
      state = state.copyWith(wines: favoriteWines, isLoading: false);
    } on Exception catch (e, stackTrace) {
      logError(e, stackTrace: stackTrace);
    }
  }

  Future<void> favoriteWine(Wine wine) async {
    try {
      await _favoriteWineUsecase(wine);
      fetchFavoriteWines();
    } on Exception catch (e, stackTrace) {
      logError(e, stackTrace: stackTrace);
    }
  }

  Future<void> unfavoriteWine(Wine wine) async {
    try {
      await _unfavoriteWineUsecase(wine.id);
      fetchFavoriteWines();
    } on Exception catch (e, stackTrace) {
      logError(e, stackTrace: stackTrace);
    }
  }
}
