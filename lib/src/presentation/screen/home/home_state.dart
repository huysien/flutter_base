import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entity/wine.dart';
import '../../../domain/entity/wine_type.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required List<Wine> wines,
    required WineType wineType,
    required bool isLoading,
  }) = _HomeState;
}
