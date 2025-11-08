import 'package:freezed_annotation/freezed_annotation.dart';

part 'wine_detail_state.freezed.dart';

@freezed
abstract class WineDetailState with _$WineDetailState {
  const factory WineDetailState({
    required bool isLoading,
  }) = _WineDetailState;
}
