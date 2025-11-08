import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_container_state.freezed.dart';

@freezed
abstract class AppContainerState with _$AppContainerState {
  const factory AppContainerState({
    @Default(false) bool isDatabaseInitialized,
    @Default(0) int seletedTabIndex,
  }) = _AppContainerState;
}
