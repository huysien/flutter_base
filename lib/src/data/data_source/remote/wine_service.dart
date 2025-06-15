import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../model/remote/wine_dto.dart';

part 'wine_service.g.dart';

@RestApi()
// ignore: one_member_abstracts
abstract class WineService {
  factory WineService(
    Dio dio, {
    ParseErrorLogger errorLogger,
  }) = _WineService;

  @GET('/wines/{type}')
  Future<List<WineDto>> getWines(@Path('type') String type);
}
