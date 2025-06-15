import 'package:freezed_annotation/freezed_annotation.dart';

part 'rating.freezed.dart';

@freezed
class Rating with _$Rating {
  const factory Rating({
    required String average,
    required String reviews,
  }) = _Rating;
}
