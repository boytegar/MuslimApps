import 'package:muslimapps/model/City.dart';
import 'package:muslimapps/model/DetailQuran.dart';
import 'package:muslimapps/model/JadwalSolat.dart';
import 'package:muslimapps/model/ListDetailQuran.dart';
import 'package:muslimapps/model/Quran.dart';
import 'package:muslimapps/model/QuranAcak.dart';
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
  @GET("/surat/{no}/ayat/{ayat}")
  Future<ListDetailQuran> getDetailListQuran(@Path("no") String no, @Path("ayat") String ayat);
  @GET("/kota")
  Future<City> getListCity();
  @GET("/kota/{id_kota}/tanggal/{tanggal}") //format tanggal "yyyy-MM-dd"
  Future<JadwalSolat> getJadwalSolat(@Path("id_kota") String id_kota, @Path("tanggal") String tanggal);
}

