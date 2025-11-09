import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/core.dart';
import '../data_source/api/wine_api_client.dart';
import '../data_source/realm/wine_realm_client.dart';

part 'data_source.g.dart';

@Riverpod(keepAlive: true)
WineRealmClient wineRealmClient(Ref ref) => WineRealmClient(
      ref.read(dbManagerProvider),
    );

@riverpod
WineApiClient wineApiClient(Ref ref) => WineApiClient(
      ref.read(dioProvider()),
      errorLogger: ref.read(networkParseErrorLoggerProvider),
    );
