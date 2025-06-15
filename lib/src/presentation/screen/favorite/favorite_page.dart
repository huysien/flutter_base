import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../res/l10n/app_localizations.dart';
import '../../shared/view_models/favorite_wines/favorite_wines_view_model.dart';
import '../../shared/views/wine_list.dart';

class FavoritePage extends ConsumerWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wines = ref.watch(favoriteWinesViewModelProvider).wines;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.favorite),
      ),
      body: WineList(
        wines: wines,
        favoriteWines: wines,
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
