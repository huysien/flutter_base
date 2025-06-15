import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../usecase/wine/favorite_wine_usecase.dart';
import '../usecase/wine/get_favorite_wines_usecase.dart';
import '../usecase/wine/search_wine_usecase.dart';
import '../usecase/wine/unfavorite_wine_usecase.dart';
import 'repositories.dart';

part 'usecases.g.dart';

@riverpod
SearchWineUsecase searchWineUsecase(Ref ref) =>
    SearchWineUsecase(ref.read(wineRepositoryProvider));

@riverpod
GetFavoriteWinesUsecase getFavoriteWinesUsecase(Ref ref) =>
    GetFavoriteWinesUsecase(ref.read(wineRepositoryProvider));

@riverpod
FavoriteWineUsecase favoriteWineUsecase(Ref ref) =>
    FavoriteWineUsecase(ref.read(wineRepositoryProvider));

@riverpod
UnfavoriteWineUsecase unfavoriteWineUsecase(Ref ref) =>
    UnfavoriteWineUsecase(ref.read(wineRepositoryProvider));
