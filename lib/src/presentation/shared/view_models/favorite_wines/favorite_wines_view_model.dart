import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/utilities/log_utils.dart';
import '../../../../domain/di/usecases.dart';
import '../../../../domain/entity/wine.dart';
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

  Future<void> fetchFavoriteWines() async {
    try {
      final favoriteWines = await ref.read(getFavoriteWinesUsecaseProvider)();
      state = state.copyWith(wines: favoriteWines);
    } on Exception catch (e, stackTrace) {
      logError(e, stackTrace: stackTrace);
    }
  }

  Future<void> favoriteWine(Wine wine) async {
    try {
      await ref.read(favoriteWineUsecaseProvider)(wine);
      fetchFavoriteWines();
    } on Exception catch (e, stackTrace) {
      logError(e, stackTrace: stackTrace);
    }
  }

  Future<void> unfavoriteWine(Wine wine) async {
    try {
      await ref.read(unfavoriteWineUsecaseProvider)(wine.id);
      fetchFavoriteWines();
    } on Exception catch (e, stackTrace) {
      logError(e, stackTrace: stackTrace);
    }
  }
}
