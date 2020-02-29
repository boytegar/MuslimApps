import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:muslimapps/bloc/detail_quran/bloc.dart';
import 'package:muslimapps/bloc/detail_quran/detail_quran_repository.dart';
import 'package:muslimapps/helper/SizeConfig.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    SizeConfig().init(context);

    return Scaffold(

      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: BlocBuilder<DetailQuranBloc, DetailQuranState>(
          condition: (previous, current) {
            print(current);
            print(previous);
            return false;
          },
          bloc: _detailQuranBloc,
          builder: (context, state) {
            print(state);
            if (state is InitialDetailQuranState) {
              print(widget.text);
                Future.delayed(Duration(seconds: 1), () {
                  _detailQuranBloc.add(
                      openBoxEvent(no: widget.text[1].toString()));
                });
            }
            else if(state is getDetailQuranState){
              print("masuk insert");
              _detailQuranBloc.add(getDataEvent(no: widget.text[1].toString(),
                  ayat: widget.text[2].toString()));
            }
            else {
              print("kelaur insert");
              var list_surat = (state as  getListDetailQuranState).list_surat;
              print(list_surat.length);
            }
            return CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.pop(context);
                      },
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
      ),
    );
  }

//  Future<void> openBox() async {
//    await Hive.openBox("surat_${widget.text[1]}");
//  }




  Widget ListQuranUi() {
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
  }


  Widget _myDetail() {
    return Container(
      padding: new EdgeInsets.only(top: SizeConfig.paddingTop),
      height: (SizeConfig.paddingTop + 66).toDouble(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(child: new Text(
              "-",
              style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontSize: 28.0
              )
          ),),
          Container(child: new Text(
              "-",
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
