import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:muslimapps/bloc/detail_quran/bloc.dart';
import 'package:muslimapps/helper/SizeConfig.dart';
import 'package:muslimapps/hive_db/ListQuran.dart';

class DetailQuranUi extends StatefulWidget {
  var text;

  DetailQuranUi({Key key, @required this.text}) : super(key: key);

  @override
  _DetailQuranUiState createState() => _DetailQuranUiState();
}

class _DetailQuranUiState extends State<DetailQuranUi> {


  @override
  void initState() {


    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var list = Hive.box("list_quran");
    ListQuran dats = list.getAt(widget.text[3]);


    return Scaffold(
      //child: Text(widget.text.toString()),
      body: BlocBuilder<DetailQuranBloc, DetailQuranState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () => Navigator.pop(context),
                ),
                title: Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Text(widget.text[0].toString())),
                centerTitle: true,
                pinned: true,
                expandedHeight: 210.0,
                flexibleSpace: FlexibleSpaceBar(
                  background: _myDetail(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _myDetail() {
    return Container(
      padding: new EdgeInsets.only(top: SizeConfig.paddingTop),
      height: (SizeConfig.paddingTop + 66).toDouble(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(child: new Text(
              "Balance",
              style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontSize: 28.0
              )
          ),),
          Container(child: new Text(
              "\u002420,914.33",
              style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w800,
                  fontSize: 36.0
              )
          ),),
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
