import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/rich_text_parser.dart';
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
      create: (context) =>
          DetailQuranBloc(detailQuranRepository: _detailQuranRepository),
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
   // Hive.close();
    super.dispose();
  }

  void saveBookmark(String status) async{
    await Hive.openBox("bookmark").then((value){

    });
  }

//
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    ScreenUtil.init(context,
        width: width, height: height, allowFontScaling: true);
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
                _detailQuranBloc
                    .add(openBoxEvent(no: widget.text[1].toString()));
              });
              return loadingBuilder();
            } else if (state is getDetailQuranState) {
              _detailQuranBloc.add(getDataEvent(
                  no: widget.text[1].toString(),
                  ayat: widget.text[2].toString()));
              return loadingBuilder();
            } else {
              var list_surat = (state as getListDetailQuranState).list_surat;
              return BodyMain(list_surat);
            }
          },
        ),
      ),
    );
  }

  String replaceCharAt(String oldString, int index, String newChar) {
    return oldString.substring(0, index) +
        newChar +
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
              child: Text(
                "${quran.nama} (${quran.asma})",
                style: TextStyle(color: Colors.white),
              )),
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

              String status_bookmark = data.bookmark;

              return ListTile(
                title: Text(
                  data.teks_arab,
                  style: TextStyle(fontSize: screenUtil.setSp(35)),
                  textAlign: TextAlign.right,
                ),
                leading: Text(
                  "${numberMap[data.id]}",
                  style: TextStyle(fontSize: screenUtil.setSp(20)),
                ),
                isThreeLine: true,
                subtitle: Column(
                  children: <Widget>[
                    Html(
                      data: data.teks_transliterasi,
                    ),
                    SizedBox(
                      height: screenUtil.setHeight(10),
                    ),
                    Text(
                      data.teks_arti,
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                trailing: (status_bookmark == "true")
                    ? GestureDetector(
                  onTap: (){
                    data.bookmark = "false";
                    data.save();
                    setState(() {
                      status_bookmark = "false";
                    });
                  },
                      child: Icon(
                          Icons.bookmark,
                          size: screenUtil.setHeight(25),
                  color: Theme.of(context).primaryColor,
                        ),
                    )
                    : GestureDetector(
                  onTap: (){
                    data.bookmark = "true";
                    data.save();
                    setState(() {
                      status_bookmark = "true";
                    });
                  },
                      child: Icon(
                          Icons.bookmark_border,
                          size: screenUtil.setHeight(25),
                        ),
                    ),
              );
            },
            childCount: list_surat.length,
          ),
        ),
      ],
    );
  }

  Widget _myDetail(ListQuran quran, ScreenUtil screenUtil) {
    return Container(
      padding: EdgeInsets.only(top: screenUtil.setHeight(80)),
      // height: (SizeConfig.paddingTop + 20).toDouble(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: screenUtil.setHeight(5),
          ),
          Container(
            child: new Text(quran.arti,
                style: TextStyle(
                    color: Colors.white,
                    // fontFamily: 'Poppins',
                    fontWeight: FontWeight.w800,
                    fontSize: screenUtil.setSp(24))),
          ),
          SizedBox(
            height: screenUtil.setHeight(5),
          ),
          Text("${quran.type} - ${quran.ayat} Ayat",
              style: TextStyle(
                  color: Colors.white,
                  //fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: screenUtil.setSp(20))),
          SizedBox(
            height: 10,
          ),
          Html(
            data: quran.keterangan,
            padding: EdgeInsets.symmetric(horizontal: screenUtil.setHeight(20)),
            defaultTextStyle:
                TextStyle(color: Colors.white, fontSize: screenUtil.setSp(10)),
            customTextAlign: (elem) {
              return TextAlign.justify;
            },
          ),
        ],
      ),
      decoration: new BoxDecoration(
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
