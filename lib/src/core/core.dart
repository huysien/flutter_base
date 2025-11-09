import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'common/network_parse_error_logger.dart';
import 'database/db_manager.dart';
import 'network/http_client.dart';

part 'core.g.dart';

@riverpod
NetworkParseErrorLogger networkParseErrorLogger(Ref ref) =>
    NetworkParseErrorLogger();

@riverpod
DbManager dbManager(Ref ref) => DbManager();

@riverpod
Dio dio(Ref ref, {String? accessToken}) =>
    createHttpClient(accessToken: accessToken);
