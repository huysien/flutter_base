import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../res/l10n/app_localizations.dart';
import '../../../domain/entity/wine_type.dart';
import '../../shared/view_models/favorite_wines/favorite_wines_view_model.dart';
import '../../shared/views/wine_list.dart';
import '../select_wine_type/select_wine_type_page.dart';
import 'home_view_model.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  void _onFilterPressed(BuildContext context, WidgetRef ref) async {
    final currentWineType = ref.read(homeViewModelProvider).wineType;
    final newWineType = await showModalBottomSheet<WineType>(
      context: context,
      builder: (context) => SelectWineTypePage(
        selectedWineType: currentWineType,
      ),
    );
    if (newWineType != null) {
      ref.read(homeViewModelProvider.notifier).setWineType(newWineType);
      ref.read(homeViewModelProvider.notifier).fetchWines();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wines = ref.watch(homeViewModelProvider).wines;
    final favoriteWines = ref.watch(favoriteWinesViewModelProvider).wines;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.wineCollection),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_alt),
            onPressed: () => _onFilterPressed(context, ref),
          ),
        ],
      ),
      body: WineList(
        wines: wines,
        favoriteWines: favoriteWines,
        onFavorite: (wine) {
          ref.read(favoriteWinesViewModelProvider.notifier).favoriteWine(wine);
        },
        onUnfavorite: (wine) {
          ref
              .read(favoriteWinesViewModelProvider.notifier)
              .unfavoriteWine(wine);
        },
      ),
    );
  }
}
