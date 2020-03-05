import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:muslimapps/bloc/quran/QuranBloc.dart';
import 'package:muslimapps/bloc/quran/QuranBlocEvent.dart';
import 'package:muslimapps/bloc/quran/QuranBlocState.dart';
import 'package:muslimapps/hive_db/ListQuran.dart';
import 'package:muslimapps/ui/detail/ui_bookmark.dart';
import 'package:muslimapps/ui/detail/ui_detail_quran.dart';
import 'package:shimmer/shimmer.dart';


class QuranPageUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuranBloc(),
      child: QuranUi(),
    );
  }
}


class QuranUi extends StatefulWidget {
  @override
  _QuranUiState createState() => _QuranUiState();
}

class _QuranUiState extends State<QuranUi> {

  QuranBloc _quranBloc;
  String ayat = "";
  Widget _title = Text("List Quran", style: TextStyle(color: Colors.white),);
  Icon _searchIcon = new Icon(Icons.search, color: Colors.white,);
  final TextEditingController _filter = new TextEditingController();
  FocusNode textFocusNode = new FocusNode();
  Box datas;

  @override
  void dispose() {
    _quranBloc?.close();
 //   Hive.close();
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

  void openPageNavigate(String nama, String nomor, String ayat, int index){
          Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  DetailQuranPage(text: [nama, nomor, ayat, index],),
              fullscreenDialog: true
          ));
//  _showDialogs();
  }

  Future<void> _showDialogs() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        String contentText = "Content of Dialog";
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text("Title of Dialog"),
              content: Text(contentText),
              actions: <Widget>[
                FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancel"),
                ),
                FlatButton(
                  onPressed: () {
                    setState(() {
                      contentText = "Changed Content of Dialog";
                    });
                  },
                  child: Text("Change"),
                ),
              ],
            );
          },
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: _title,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        actions: <Widget>[
          new IconButton(
              icon: _searchIcon,
              onPressed: () {
                FocusScope.of(context).requestFocus(textFocusNode);
                _searchPressed();
              },
              color: Colors.white
          ),
          IconButton(
            icon: Icon(Icons.bookmark_border),
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          BookmarkPage(),
                      fullscreenDialog: true
                  ));
            },
            color: Colors.white,
          )
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
            } else if (state is getListState) {
              _quranBloc.add(InsertListToDbEvent());
            } else {
              datas = (state as getListStateFromDb).list_quran_data;
            }
            if (datas == null) {
              return buildLoading();
            } else {
              return _listQuran(datas);
            }
          },
        ),
      ),
    );
  }



  Widget _listQuran(Box quran){
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {
          Future.delayed(Duration(seconds: 3), (){
            _quranBloc.add(InsertListToDbEvent());
          });
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
                  //_navigateToDetail(hasil.nama, hasil.nomor, hasil.ayat, index),
              openPageNavigate(hasil.nama, hasil.nomor, hasil.ayat, index),
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
                openPageNavigate(hasil.nama, hasil.nomor, hasil.ayat, index);
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
        this._searchIcon = new Icon(Icons.close, color: Colors.white);
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
        this._title =
        new Text('List Quran', style: TextStyle(color: Colors.white),);
        //   filteredNames = names;
        _filter.clear();
      }
    });
  }


}
