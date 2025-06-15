import 'package:realm/realm.dart';

import '../../data/model/local/wine_local.dart';

class DbManager {
  static final DbManager _instance = DbManager._internal();

  factory DbManager() => _instance;

  DbManager._internal();

  late final Realm favoriteWineRealm;

  static Future<void> initialize() async {
    final config = Configuration.local([WineLocal.schema, RatingLocal.schema]);
    _instance.favoriteWineRealm = await Realm.open(config);
  }
}
