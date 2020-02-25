import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:muslimapps/bloc/quran/QuranBloc.dart';
import 'package:muslimapps/bloc/quran/QuranBlocEvent.dart';
import 'package:muslimapps/bloc/quran/QuranBlocState.dart';
import 'package:muslimapps/hive_db/ListQuran.dart';
import 'package:muslimapps/model/DetailQuran.dart';
import 'package:muslimapps/model/ListDetailQuran.dart';
import 'package:muslimapps/request/base_request.dart';
import 'package:muslimapps/ui/detail/ui_detail_quran.dart';
import 'package:shimmer/shimmer.dart';


class QuranUi extends StatefulWidget {
  @override
  _QuranUiState createState() => _QuranUiState();
}

class _QuranUiState extends State<QuranUi> {

  QuranBloc _quranBloc;
  String ayat = "";
  Widget _title = Text("List Quran");
  Icon _searchIcon = new Icon(Icons.search);
  final TextEditingController _filter = new TextEditingController();
  FocusNode textFocusNode = new FocusNode();


  @override
  void dispose() {
    _quranBloc?.close();
    super.dispose();
  }


  @override
  void initState() {
    _quranBloc = BlocProvider.of<QuranBloc>(context);

    _filter.addListener(() {
      setState(() {
        ayat = _filter.text;
      });
    });

    super.initState();
  }

  void _navigateToDetail(String nama, String nomor, String ayat, int index) async {
  Hive.openBox("surat_$nomor").then((value) =>
  (value.length == 0)? _downloadSurat(nomor, ayat): openPageNavigate(nama, nomor, ayat, index)
  );
  }

  void openPageNavigate(String nama, String nomor, String ayat, int index){
          Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  DetailQuranUi(text: [nama, nomor, ayat, index],),
              fullscreenDialog: true
          ));
  }

  Future<void> _showDialogs(String nomor, String ayat) async {
    String status = "Belum";

    _downloadSurat(nomor, ayat);

    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          //  title: Text('Rewind and remember'),
          content: SingleChildScrollView(
            child: Center(
              child: ListBody(
                children: <Widget>[
                  Center(
                    child: CircularProgressIndicator(),
                  ),
                  SizedBox(height: 10,),
                  Text((status == "Download")
                      ? 'Sedang Mengambil Data Quran'
                      : (status == "Belum")
                      ? 'Quran Belum Di Download'
                      : 'Quran Selesai Di download'),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text((status == "Mulai") ? 'Download' : 'Selesai'),
              onPressed: () {},
            ),

          ],
        );
      },
    );
  }

  Future<void> _downloadSurat(String no, String ayat) async {
    final dio = Dio();
    final client = RestClient(dio);
    int ay = int.parse(ayat);
    if (ay <= 10) {

//      ListDetailQuran c = await client.getDetailListQuran(no, "1-$ayat");
//
//      for(var i = 0; i<c.ayat.proses.length; i++){
//        print(c.ayat.data_.ar[i].teks);
//        print(c.ayat.data_.id[i].teks);
//        print(c.ayat.data_.idt[i].teks);
//      }

    await client.getDetailListQuran(no, "1-$ayat").then((value) =>
    value.ayat.proses.forEach((element) {
      print(value.ayat.data_.ar[element-1].teks);
      print(value.ayat.data_.id[element-1].teks);
      print(value.ayat.data_.idt[element-1].teks);
    })
    );

    } else if(ay%10==0){
      int foo = (ay / 10).floor();
      for (var i = 0; i < foo; i++) {
        print(i);
        await client.getDetailListQuran(no, "${i}1-$ayat")
            .then((value) =>
            value.ayat.proses.forEach((element) {
              print(value.ayat.data_.ar[element-((i*10)+1)].teks);
              print(value.ayat.data_.id[element-((i*10)+1)].teks);
              print(value.ayat.data_.idt[element-((i*10)+1)].teks);
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
              print(value.ayat.data_.ar[element-((i*10)+1)].teks);
              print(value.ayat.data_.id[element-((i*10)+1)].teks);
              print(value.ayat.data_.idt[element-((i*10)+1)].teks);
            })
        )
            .whenComplete(() =>
           print("success")
        );
      }
    }
  }

  Widget _listQuran(Box quran){
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {
          _quranBloc.add(GetListQuranEvent());
        });
      },
      child: (ayat == null || ayat == "") ? _noFilter(quran) : _withFilter(quran),
    );
  }

  Widget buildLoading() {
    return Container(
        padding: EdgeInsets.all(25.0),
        child:SingleChildScrollView(
          child: Shimmer.fromColors(
              direction: ShimmerDirection.ltr,
              // period: Duration(seconds:3),
              child: Column(
                children: [0, 1, 2, 3,4,5,6,7,8,9,10]
                    .map((_) => Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 48.0,
                        height: 48.0,
                        color: Colors.white,
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 8.0),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 8.0,
                              color: Colors.white,
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(vertical: 2.0),
                            ),
                            Container(
                              width: double.infinity,
                              height: 8.0,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                )
                    .toList(),
              ),
              baseColor: Colors.grey[400],
              highlightColor: Colors.white),
        )
    );
  }

  Widget _noFilter(Box quran) {
    return Container(
      color: Colors.white10,
      child: ListView.builder(scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: quran.length,
        itemBuilder: (context, index) {
          ListQuran hasil = quran.getAt(index);
          // return Text("${quran.hasil[index].arti}");
          return Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white
            ),
            child: ListTile(
              onTap: () =>
                  _navigateToDetail(hasil.nama, hasil.nomor, hasil.ayat, index),
              title: Text("${hasil.nama}"),
              trailing: Text("${hasil.asma}"),
              leading: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "${hasil.nomor}", style: TextStyle(fontSize: 15),),
              ),
              subtitle: Text(
                "${hasil.arti} - ${hasil.ayat} ayat",
                style: TextStyle(fontSize: 12),),
            ),
          );
        },),
    );
  }

  Widget _withFilter(Box quran) {
    List<ListQuran> _hasils = [];

    for(int i=0; i<quran.length; i++){
      ListQuran data = quran.getAt(i);
      if (data.nama.toLowerCase().contains(ayat.toLowerCase())) {
        _hasils.add(data);
      }
    }


    return Container(
      color: Colors.white10,
      child: ListView.builder(scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: _hasils.length,
        itemBuilder: (context, index) {
          ListQuran hasil = _hasils[index];
          return Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white
            ),
            child: ListTile(
              onTap: () {
                _navigateToDetail(hasil.nama, hasil.nomor, hasil.ayat, index);
              },
              title: Text("${hasil.nama}"),
              trailing: Text("${hasil.asma}"),
              leading: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "${hasil.nomor}", style: TextStyle(fontSize: 15),),
              ),
              subtitle: Text(
                "${hasil.arti} - ${hasil.ayat} ayat",
                style: TextStyle(fontSize: 12),),
            ),
          );
        },),
    );
  }

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._title = new TextFormField(
          controller: _filter,
          focusNode: textFocusNode,
          textAlignVertical: TextAlignVertical.center,
          decoration: new InputDecoration(
              prefixIcon: new Icon(Icons.search, color: Colors.white,),
              hintText: 'Cari Nama Surat ...',
              hintStyle: TextStyle(color: Colors.white),
              contentPadding: EdgeInsets.all(10),
              border: InputBorder.none
          ),
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        );
      } else {
        this._searchIcon = new Icon(Icons.search, color: Colors.white,);
        this._title = new Text('List Quran');
        //   filteredNames = names;
        _filter.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: _title,
        centerTitle: true,
        actions: <Widget>[
          new IconButton(
            icon: _searchIcon,
            onPressed: () {
              FocusScope.of(context).requestFocus(textFocusNode);
              _searchPressed();
            },
          ),
        ],

      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: BlocBuilder<QuranBloc, QuranBlocState>(
          bloc: _quranBloc,
          builder: (context, state) {
            if (state is initQuranState) {
              Future.delayed(const Duration(seconds: 3), () {
                _quranBloc.add(GetListQuranEvent());
              });
              return buildLoading();
            } else if (state is getListState) {
              var list_quran = Hive.box("list_quran");
              print("size list ${list_quran.length}");
              if (list_quran.length == 0 || list_quran.length == null ) {
                print("masukin");
                _quranBloc.add(InsertListToDbEvent());
              } else{
                print("keluarin");
                _quranBloc.add(GetListQuranDbEvent());
              }
              return Container();
            }
            else if(state is getStatusInsertState){
              _quranBloc.add(GetListQuranDbEvent());
              return Container();
            }
            else {
              var quran = Hive.box("list_quran");
              return _listQuran(quran);
            }
          },
        ),
      ),
    );
  }
}
