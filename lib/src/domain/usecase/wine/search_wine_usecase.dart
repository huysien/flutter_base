import '../../entity/wine.dart';
import '../../entity/wine_type.dart';
import '../../repository/wine_repository.dart';

class SearchWineUsecase {
  final WineRepository _wineRepository;

  SearchWineUsecase(this._wineRepository);

  Future<List<Wine>> call({
    required WineType type,
    String? name,
    String? winery,
    String? location,
  }) =>
      _wineRepository.getWines(
        type: type.name,
        name: name,
        winery: winery,
        location: location,
      );
}
