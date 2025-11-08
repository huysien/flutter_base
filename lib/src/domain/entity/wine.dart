import 'package:freezed_annotation/freezed_annotation.dart';

import 'rating.dart';

part 'wine.freezed.dart';

@freezed
abstract class Wine with _$Wine {
  const factory Wine({
    required int id,
    required String wine,
    required String winery,
    required Rating rating,
    required String location,
    required String image,
  }) = _Wine;
}
