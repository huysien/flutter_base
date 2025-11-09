import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entity/rating.dart';

part 'rating_api_model.freezed.dart';
part 'rating_api_model.g.dart';

@freezed
abstract class RatingApiModel with _$RatingApiModel {
  const factory RatingApiModel({
    required String average,
    required String reviews,
  }) = _RatingApiModel;

  factory RatingApiModel.fromJson(Map<String, dynamic> json) =>
      _$RatingApiModelFromJson(json);

  factory RatingApiModel.fromRating(Rating rating) => RatingApiModel(
        average: rating.average,
        reviews: rating.reviews,
      );
}

extension RatingApiModelExt on RatingApiModel {
  Rating toRating() => Rating(
        average: average,
        reviews: reviews,
      );
}
