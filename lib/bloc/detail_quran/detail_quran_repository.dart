

import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:muslimapps/hive_db/ListQuran.dart';
import 'package:muslimapps/hive_db/ListSurat.dart';
import 'package:muslimapps/request/base_request.dart';

class DetailQuranRepository{

  DetailQuranRepository();

  Future<Box<dynamic>> insertDetailQuran(String no, String ayat) async {
    final dio = Dio();
    final client = RestClient(dio);
    int ay = int.parse(ayat);
    var list_ayat = Hive.box("surat_$no");
    if (ay <= 10) {

      await client.getDetailListQuran(no, "1-$ayat").then((value) =>
          value.ayat.proses.forEach((element) {
            ListSurat listSurat = ListSurat();
            listSurat.id = element;
            listSurat.surat = int.parse(value.surat.nomor);
            listSurat.teks_arab = value.ayat.data.ar[element-1].teks;
            listSurat.teks_arti = value.ayat.data.id[element-1].teks;
            listSurat.teks_transliterasi = value.ayat.data.idt[element-1].teks;
            listSurat.bookmark = "false";
            list_ayat.add(listSurat);
          })
      );

    }
    else if(ay%10==0){

      int foo = (ay / 10).floor();
      for (var i = 0; i < foo; i++) {
        print(i);
        await client.getDetailListQuran(no, "${i}1-$ayat")
            .then((value) =>
            value.ayat.proses.forEach((element) {

              ListSurat listSurat = ListSurat();
              listSurat.id = element;
              listSurat.surat = int.parse(value.surat.nomor);
              listSurat.teks_arab = value.ayat.data.ar[element-((i*10)+1)].teks;
              listSurat.teks_arti = value.ayat.data.id[element-((i*10)+1)].teks;
              listSurat.teks_transliterasi = value.ayat.data.idt[element-((i*10)+1)].teks;
              listSurat.bookmark = "false";
              list_ayat.add(listSurat);

            })
        )
            .whenComplete(() =>
            print("success")
        );
      }
    }
    else {
      int foo = (ay / 10).floor();
      for (var i = 0; i <= foo; i++) {
        print(i);
        if(i==foo){
          i-1;
        }
        await client.getDetailListQuran(no, "${i}1-$ayat")
            .then((value) =>
            value.ayat.proses.forEach((element) {
              ListSurat listSurat = ListSurat();
              listSurat.id = element;
              listSurat.surat = int.parse(value.surat.nomor);
              listSurat.teks_arab = value.ayat.data.ar[element-((i*10)+1)].teks;
              listSurat.teks_arti = value.ayat.data.id[element-((i*10)+1)].teks;
              listSurat.teks_transliterasi = value.ayat.data.idt[element-((i*10)+1)].teks;
              listSurat.bookmark = "false";
              list_ayat.add(listSurat);
            })
        )
            .whenComplete(() =>
            print("success")
        );
      }
    }
    return list_ayat;
  }

  Future<Box<dynamic>> getDetailQuran(String no)async{
    var list_ayat = Hive.box("surat_$no");
    return  list_ayat;
  }

}