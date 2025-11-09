import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../model/api/wine_api_model.dart';

part 'wine_api_client.g.dart';

@RestApi()
// ignore: one_member_abstracts
abstract class WineApiClient {
  factory WineApiClient(
    Dio dio, {
    ParseErrorLogger errorLogger,
  }) = _WineApiClient;

  @GET('/wines/{type}')
  Future<List<WineApiModel>> getWines(@Path('type') String type);
}
