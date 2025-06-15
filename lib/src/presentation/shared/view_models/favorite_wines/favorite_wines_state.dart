import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/entity/wine.dart';

part 'favorite_wines_state.freezed.dart';

@freezed
class FavoriteWinesState with _$FavoriteWinesState {
  const factory FavoriteWinesState({
    required List<Wine> wines,
    required bool isLoading,
  }) = _FavoriteWinesState;
}
