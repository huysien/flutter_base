import 'package:realm/realm.dart';

import '../../../domain/entity/rating.dart';
import '../../../domain/entity/wine.dart';

part 'wine_realm_model.realm.dart';

@RealmModel()
class _WineRealmModel {
  @PrimaryKey()
  late int id;

  late String wine;
  late String winery;
  _RatingRealmModel? rating;
  late String location;
  late String image;
}

@RealmModel(ObjectType.embeddedObject)
class _RatingRealmModel {
  late String average;
  late String reviews;
}

extension RatingRealmModelExt on RatingRealmModel {
  Rating toRating() => Rating(
        average: average,
        reviews: reviews,
      );

  static RatingRealmModel fromRating(Rating rating) => RatingRealmModel(
        rating.average,
        rating.reviews,
      );
}

extension WineRealmModelExt on WineRealmModel {
  static WineRealmModel fromWine(Wine wine) => WineRealmModel(
        wine.id,
        wine.wine,
        wine.winery,
        wine.location,
        wine.image,
        rating: RatingRealmModelExt.fromRating(wine.rating),
      );

  Wine toWine() => Wine(
        id: id,
        wine: wine,
        winery: winery,
        rating: Rating(
          average: rating!.average,
          reviews: rating!.reviews,
        ),
        location: location,
        image: image,
      );
}
