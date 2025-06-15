import 'package:dio/dio.dart';

import 'api_config.dart';

Dio createApiClient({String? accessToken}) {
  var headers = <String, dynamic>{};
  if (accessToken != null) {
    headers['accessToken'] = accessToken;
  }
  final client = Dio(BaseOptions(baseUrl: ApiConfig.baseUrl, headers: headers));
  client.interceptors.add(LogInterceptor(
    requestBody: true,
    responseBody: true,
  ));
  return client;
}
