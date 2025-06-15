import '../../domain/entity/wine.dart';
import '../../domain/repository/wine_repository.dart';
import '../data_source/local/wine_db_service.dart';
import '../data_source/remote/wine_service.dart';
import '../model/local/wine_local.dart';
import '../model/remote/wine_dto.dart';

class WineRepositoryImpl extends WineRepository {
  WineRepositoryImpl(this._wineService, this._wineDbService);

  final WineService _wineService;
  final WineDbService _wineDbService;

  @override
  Future<List<Wine>> getWines(
          {required String type,
          String? name,
          String? winery,
          String? location}) async =>
      (await _wineService.getWines(type)) // TODO: Implement filtering
          .map((wineDto) => wineDto.toWine())
          .toList();

  @override
  Future<List<Wine>> getFavoriteWines() async => _wineDbService
      .getFavoriteWines()
      .map((wineLocal) => wineLocal.toWine())
      .toList();

  @override
  Future<void> favoriteWine(Wine wine) =>
      _wineDbService.addFavoriteWine(WineLocalExt.fromWine(wine));

  @override
  Future<void> unfavoriteWine(int id) => _wineDbService.removeFavoriteWine(id);
}
