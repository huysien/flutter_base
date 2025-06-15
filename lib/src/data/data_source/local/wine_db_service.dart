import 'package:realm/realm.dart';

import '../../../core/database/db_manager.dart';
import '../../model/local/wine_local.dart';

class WineDbService {
  WineDbService({required this.dbManager});

  DbManager dbManager;
  Realm get favoriteWineRealm => dbManager.favoriteWineRealm;

  List<WineLocal> getFavoriteWines() =>
      favoriteWineRealm.all<WineLocal>().toList();

  Future<void> addFavoriteWine(WineLocal wine) async {
    favoriteWineRealm.write(() {
      favoriteWineRealm.add(wine);
    });
  }

  Future<void> removeFavoriteWine(int id) async {
    final favoriteWines = favoriteWineRealm.all<WineLocal>().query("id == $id");
    if (favoriteWines.isNotEmpty) {
      favoriteWineRealm.write(() {
        favoriteWineRealm.deleteMany(favoriteWines);
      });
    }
  }
}
