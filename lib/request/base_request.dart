import 'package:market_app/model/DetailQuran.dart';
import 'package:market_app/model/ListDetailQuran.dart';
import 'package:market_app/model/Quran.dart';
import 'package:market_app/model/QuranAcak.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'base_request.g.dart';

@RestApi(baseUrl: "https://api.banghasan.com/quran/format/json")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;
  @GET("/surat")
  Future<Quran> getListQuran();
  @GET("/acak")
  Future<QuranAcak> getQuranAcak();
  @GET("/surat/{id}")
  Future<DetailQuran> getDetailQuran(@Path("id") String id);
  @GET("surat/{no}/ayat{ayat}")
  Future<ListDetailQuran> getDetailListQuran(@Path("no") String no, @Path("ayat") String ayat);
}

