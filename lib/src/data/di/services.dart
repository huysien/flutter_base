import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/di/common.dart';
import '../../core/di/database.dart';
import '../../core/di/network.dart';
import '../data_source/local/wine_db_service.dart';
import '../data_source/remote/wine_service.dart';

part 'services.g.dart';

@Riverpod(keepAlive: true)
WineDbService wineDbService(Ref ref) => WineDbService(
      dbManager: ref.read(dbManagerProvider),
    );

@riverpod
WineService wineService(Ref ref) => WineService(
      ref.read(dioProvider()),
      errorLogger: ref.read(networkParseErrorLoggerProvider),
    );
