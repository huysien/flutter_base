import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entity/wine.dart';
import 'rating_dto.dart';

part 'wine_dto.freezed.dart';
part 'wine_dto.g.dart';

@freezed
abstract class WineDto with _$WineDto {
  const factory WineDto({
    required int id,
    required String wine,
    required String winery,
    required RatingDto rating,
    required String location,
    required String image,
  }) = _WineDto;

  factory WineDto.fromJson(Map<String, dynamic> json) =>
      _$WineDtoFromJson(json);

  factory WineDto.fromWine(Wine wine) => WineDto(
        id: wine.id,
        wine: wine.wine,
        winery: wine.winery,
        rating: RatingDto.fromRating(wine.rating),
        location: wine.location,
        image: wine.image,
      );
}

extension WineDtoExt on WineDto {
  Wine toWine() => Wine(
        id: id,
        wine: wine,
        winery: winery,
        rating: rating.toRating(),
        location: location,
        image: image,
      );
}
