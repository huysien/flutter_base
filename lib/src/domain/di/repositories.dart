import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/di/services.dart';
import '../../data/repository_impl/wine_repository_impl.dart';
import '../repository/wine_repository.dart';

part 'repositories.g.dart';

@riverpod
WineRepository wineRepository(Ref ref) => WineRepositoryImpl(
      ref.read(wineServiceProvider),
      ref.read(wineDbServiceProvider),
    );
