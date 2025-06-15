import '../../entity/wine.dart';
import '../../repository/wine_repository.dart';

class FavoriteWineUsecase {
  final WineRepository _wineRepository;

  FavoriteWineUsecase(this._wineRepository);

  Future<void> call(Wine wine) => _wineRepository.favoriteWine(wine);
}
