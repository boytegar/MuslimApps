import 'package:market_app/model/Quran.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'base_request.g.dart';

@RestApi(baseUrl: "https://api.banghasan.com/quran/format/json/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/surat")
  Future<Quran> getListQuran();
}

