import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../network/api_client.dart';

part 'network.g.dart';

@riverpod
Dio dio(Ref ref, {String? accessToken}) =>
    createApiClient(accessToken: accessToken);
