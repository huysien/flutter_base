import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../res/l10n/app_localizations.dart';
import '../favorite/favorite_page.dart';
import '../home/home_page.dart';
import 'app_container_view_model.dart';

class AppContainerPage extends ConsumerStatefulWidget {
  const AppContainerPage({super.key});

  @override
  ConsumerState<AppContainerPage> createState() => _AppContainerPageState();
}

class _AppContainerPageState extends ConsumerState<AppContainerPage> {
  final _home = HomePage();
  final _favorite = FavoritePage();

  @override
  void initState() {
    ref.read(appContainerViewModelProvider.notifier).initDatabase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isDatabaseInitialized = ref.watch(
      appContainerViewModelProvider
          .select((value) => value.isDatabaseInitialized),
    );
    return Scaffold(
      bottomNavigationBar: isDatabaseInitialized
          ? NavigationBar(
              onDestinationSelected: (value) {
                ref
                    .read(appContainerViewModelProvider.notifier)
                    .updateSelectedTabIndex(value);
              },
              selectedIndex:
                  ref.watch(appContainerViewModelProvider).seletedTabIndex,
              destinations: [
                NavigationDestination(
                  icon: Icon(Icons.home),
                  label: AppLocalizations.of(context)!.home,
                ),
                NavigationDestination(
                  icon: Icon(Icons.favorite),
                  label: AppLocalizations.of(context)!.favorite,
                ),
              ],
            )
          : null,
      body: isDatabaseInitialized
          ? IndexedStack(
              index: ref.watch(appContainerViewModelProvider).seletedTabIndex,
              children: [_home, _favorite],
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
