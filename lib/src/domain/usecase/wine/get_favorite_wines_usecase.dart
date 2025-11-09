import '../../entity/wine.dart';
import '../../repository/wine/wine_repository.dart';

class GetFavoriteWinesUsecase {
  final WineRepository _wineRepository;

  GetFavoriteWinesUsecase(this._wineRepository);

  Future<List<Wine>> call() => _wineRepository.getFavoriteWines();
}
