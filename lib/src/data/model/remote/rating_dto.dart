import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entity/rating.dart';

part 'rating_dto.freezed.dart';
part 'rating_dto.g.dart';

@freezed
class RatingDto with _$RatingDto {
  const factory RatingDto({
    required String average,
    required String reviews,
  }) = _RatingDto;

  factory RatingDto.fromJson(Map<String, dynamic> json) =>
      _$RatingDtoFromJson(json);

  factory RatingDto.fromRating(Rating rating) => RatingDto(
        average: rating.average,
        reviews: rating.reviews,
      );
}

extension RatingDtoExt on RatingDto {
  Rating toRating() => Rating(
        average: average,
        reviews: reviews,
      );
}
