import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/data_source/data_source.dart';
import '../../data/repository_impl/wine_repository_impl.dart';
import 'wine/wine_repository.dart';

part 'repository.g.dart';

@riverpod
WineRepository wineRepository(Ref ref) => WineRepositoryImpl(
      ref.read(wineApiClientProvider),
      ref.read(wineRealmClientProvider),
    );
