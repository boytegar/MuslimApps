import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:muslimapps/bloc/detail_quran/bloc.dart';
import 'package:muslimapps/bloc/detail_quran/detail_quran_repository.dart';
import 'package:muslimapps/hive_db/ListQuran.dart';

class DetailQuranPage extends StatelessWidget {
  DetailQuranRepository _detailQuranRepository = DetailQuranRepository();

  var text;

  DetailQuranPage({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailQuranBloc(detailQuranRepository: _detailQuranRepository),
      child: DetailQuranUi(text: text),
    );
  }

}


class DetailQuranUi extends StatefulWidget {
  var text;

  DetailQuranUi({Key key, @required this.text}) : super(key: key);


  @override
  _DetailQuranUiState createState() => _DetailQuranUiState();
}

class _DetailQuranUiState extends State<DetailQuranUi> {

  DetailQuranBloc _detailQuranBloc;


  @override
  void initState() {
    _detailQuranBloc = BlocProvider.of<DetailQuranBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    _detailQuranBloc.close();
    super.dispose();
  }

//
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;

    ScreenUtil.init(
        context, width: width, height: height, allowFontScaling: true);

    return Scaffold(

      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: BlocBuilder<DetailQuranBloc, DetailQuranState>(
          bloc: _detailQuranBloc,
          builder: (context, state) {
            print(state);
            if (state is InitialDetailQuranState) {
              print(widget.text);
                Future.delayed(Duration(seconds: 1), () {
                  _detailQuranBloc.add(
                      openBoxEvent(no: widget.text[1].toString()));
                });
              return loadingBuilder();
            }
            else if(state is getDetailQuranState){
              print("masuk insert");
              _detailQuranBloc.add(getDataEvent(no: widget.text[1].toString(),
                  ayat: widget.text[2].toString()));
              return loadingBuilder();
            }
            else {
              print("kelaur insert");
              var list_surat = (state as  getListDetailQuranState).list_surat;
              return BodyMain(list_surat);
            }
          },
        ),
      ),
    );
  }

  String replaceCharAt(String oldString, int index, String newChar) {
    return oldString.substring(0, index) + newChar +
        oldString.substring(index + 1);
  }

  Widget loadingBuilder() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget BodyMain(Box list_surat) {
    var list_quran = Hive.box("list_quran");
    int pos = int.parse(widget.text[1]);
    ListQuran quran = list_quran.getAt(pos - 1);
    ScreenUtil screenUtil = ScreenUtil();
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Container(
              margin: EdgeInsets.only(top: 5),
              child: Text("${quran.nama} (${quran.asma})", style: TextStyle(color: Colors.white),)
          ),
          centerTitle: true,
          pinned: true,
          expandedHeight: screenUtil.setHeight(300),
          flexibleSpace: FlexibleSpaceBar(
            background: _myDetail(quran, screenUtil),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (context, index) {
              const numberMap = {
                0: '۰',
                1: '۱',
                2: '۲',
                3: '۳',
                4: '۴',
                5: '۵',
                6: '۶',
                7: '۷',
                8: '۸',
                9: '۹'
              };
              ListSurat data = list_surat.getAt(index);

              return ListTile(
                title: Text(
                  data.teks_arab,
                  style: TextStyle(fontSize: screenUtil.setSp(35)),
                  textAlign: TextAlign.right,
                ),
                leading: Text(
                  "${numberMap[data.id]}",
                  style: TextStyle(fontSize: screenUtil.setSp(20)),),
                isThreeLine: true,
                subtitle: Column(
                  children: <Widget>[
                    Html(data: data.teks_transliterasi,),
                    SizedBox(height: screenUtil.setHeight(10),),
                    Text(data.teks_arti, textAlign: TextAlign.justify,
                      style: TextStyle(fontWeight: FontWeight.w300),),
                  ],
                ),
                trailing: Icon(
                  FontAwesomeIcons.bookmark, size: screenUtil.setHeight(15),),

              );
            },
            childCount: list_surat.length,
          ),
        ),
      ],
    );
  }


//  Widget ListQuranUi() {
//    return CustomScrollView(
//      slivers: <Widget>[
//        SliverAppBar(
//          leading: IconButton(
//            icon: Icon(Icons.arrow_back_ios),
//            onPressed: () => Navigator.pop(context),
//          ),
//          title: Container(
//              margin: EdgeInsets.only(top: 5),
//              child: Text(widget.text[0].toString())),
//          centerTitle: true,
//          pinned: true,
//          expandedHeight: 210.0,
//          flexibleSpace: FlexibleSpaceBar(
//            background: _myDetail(),
//          ),
//        ),
//      ],
//    );
//  }


  Widget _myDetail(ListQuran quran, ScreenUtil screenUtil) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: screenUtil.setHeight(10)),
      // height: (SizeConfig.paddingTop + 20).toDouble(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(child: new Text(
              quran.arti,
              style: TextStyle(
                  color: Colors.white,
                  // fontFamily: 'Poppins',
                  fontWeight: FontWeight.w800,
                  fontSize: screenUtil.setSp(24)
              )
          ),),
          SizedBox(height: 10,),
          Text("${quran.type} - ${quran.ayat} Ayat", style: TextStyle(
              color: Colors.white,
              //fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              fontSize: screenUtil.setSp(20)
          )),
          Html(data: quran.keterangan,
              padding: EdgeInsets.all(screenUtil.setHeight(10)),
              defaultTextStyle: TextStyle(
                  color: Colors.white, fontSize: screenUtil.setSp(10)),
              customTextAlign: (elem) {
                return TextAlign.justify;
              },
          )
        ],
      ),
      decoration: new BoxDecoration(
        color: Theme
            .of(context)
            .primaryColor,
      ),
    );
  }

}
