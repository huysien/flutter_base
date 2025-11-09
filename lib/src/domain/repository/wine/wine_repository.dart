import '../../entity/wine.dart';

abstract class WineRepository {
  Future<List<Wine>> getWines({
    required String type,
    String? name,
    String? winery,
    String? location,
  });

  Future<List<Wine>> getFavoriteWines();

  Future<void> favoriteWine(Wine wine);

  Future<void> unfavoriteWine(int id);
}
