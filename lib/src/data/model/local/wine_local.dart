import 'package:realm/realm.dart';

import '../../../domain/entity/rating.dart';
import '../../../domain/entity/wine.dart';

part 'wine_local.realm.dart';

@RealmModel()
class _WineLocal {
  @PrimaryKey()
  late int id;

  late String wine;
  late String winery;
  _RatingLocal? rating;
  late String location;
  late String image;
}

@RealmModel(ObjectType.embeddedObject)
class _RatingLocal {
  late String average;
  late String reviews;
}

extension RatingLocalExt on RatingLocal {
  Rating toRating() => Rating(
        average: average,
        reviews: reviews,
      );

  static RatingLocal fromRating(Rating rating) => RatingLocal(
        rating.average,
        rating.reviews,
      );
}

extension WineLocalExt on WineLocal {
  static WineLocal fromWine(Wine wineDto) => WineLocal(
        wineDto.id,
        wineDto.wine,
        wineDto.winery,
        wineDto.location,
        wineDto.image,
        rating: RatingLocalExt.fromRating(wineDto.rating),
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
