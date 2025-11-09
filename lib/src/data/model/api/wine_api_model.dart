import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entity/wine.dart';
import 'rating_api_model.dart';

part 'wine_api_model.freezed.dart';
part 'wine_api_model.g.dart';

@freezed
abstract class WineApiModel with _$WineApiModel {
  const factory WineApiModel({
    required int id,
    required String wine,
    required String winery,
    required RatingApiModel rating,
    required String location,
    required String image,
  }) = _WineApiModel;

  factory WineApiModel.fromJson(Map<String, dynamic> json) =>
      _$WineApiModelFromJson(json);

  factory WineApiModel.fromWine(Wine wine) => WineApiModel(
        id: wine.id,
        wine: wine.wine,
        winery: wine.winery,
        rating: RatingApiModel.fromRating(wine.rating),
        location: wine.location,
        image: wine.image,
      );
}

extension WineApiModelExt on WineApiModel {
  Wine toWine() => Wine(
        id: id,
        wine: wine,
        winery: winery,
        rating: rating.toRating(),
        location: location,
        image: image,
      );
}
