import '../../domain/entity/wine.dart';
import '../../domain/repository/wine/wine_repository.dart';
import '../data_source/api/wine_api_client.dart';
import '../data_source/realm/wine_realm_client.dart';
import '../model/api/wine_api_model.dart';
import '../model/realm/wine_realm_model.dart';

class WineRepositoryImpl extends WineRepository {
  WineRepositoryImpl(this._wineApiClient, this._wineRealmClient);

  final WineApiClient _wineApiClient;
  final WineRealmClient _wineRealmClient;

  @override
  Future<List<Wine>> getWines(
          {required String type,
          String? name,
          String? winery,
          String? location}) async =>
      (await _wineApiClient.getWines(type)) // TODO: Implement filtering
          .map((wineApiModel) => wineApiModel.toWine())
          .toList();

  @override
  Future<List<Wine>> getFavoriteWines() async => _wineRealmClient
      .getFavoriteWines()
      .map((wineRealmModel) => wineRealmModel.toWine())
      .toList();

  @override
  Future<void> favoriteWine(Wine wine) =>
      _wineRealmClient.addFavoriteWine(WineRealmModelExt.fromWine(wine));

  @override
  Future<void> unfavoriteWine(int id) =>
      _wineRealmClient.removeFavoriteWine(id);
}
