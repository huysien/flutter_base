import 'package:realm/realm.dart';

import '../../../core/database/db_manager.dart';
import '../../model/realm/wine_realm_model.dart';

class WineRealmClient {
  WineRealmClient(this._dbManager);

  final DbManager _dbManager;
  Realm get _favoriteWineRealm => _dbManager.favoriteWineRealm;

  List<WineRealmModel> getFavoriteWines() =>
      _favoriteWineRealm.all<WineRealmModel>().toList();

  Future<void> addFavoriteWine(WineRealmModel wine) async {
    _favoriteWineRealm.write(() {
      _favoriteWineRealm.add(wine);
    });
  }

  Future<void> removeFavoriteWine(int id) async {
    final favoriteWines =
        _favoriteWineRealm.all<WineRealmModel>().query("id == $id");
    if (favoriteWines.isNotEmpty) {
      _favoriteWineRealm.write(() {
        _favoriteWineRealm.deleteMany(favoriteWines);
      });
    }
  }
}
