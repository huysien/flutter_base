import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/database/db_manager.dart';
import 'app_container_state.dart';

part 'app_container_view_model.g.dart';

@riverpod
class AppContainerViewModel extends _$AppContainerViewModel {
  @override
  AppContainerState build() => AppContainerState(seletedTabIndex: 0);

  Future<void> initDatabase() async {
    await DbManager.initialize();
    state = state.copyWith(isDatabaseInitialized: true);
  }

  void updateSelectedTabIndex(int index) {
    state = state.copyWith(seletedTabIndex: index);
  }
}
