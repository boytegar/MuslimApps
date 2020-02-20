import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/bloc/quran/QuranBloc.dart';
import 'package:market_app/bloc/quran/QuranBlocEvent.dart';
import 'package:market_app/bloc/quran/QuranBlocState.dart';
import 'package:market_app/model/Quran.dart';

class QuranUi extends StatefulWidget {
  @override
  _QuranUiState createState() => _QuranUiState();
}

class _QuranUiState extends State<QuranUi> {

  QuranBloc _quranBloc;

  String ayat = "";

  @override
  void dispose() {
    super.dispose();
    _quranBloc?.close();
  }

  @override
  void initState() {
    _quranBloc = BlocProvider.of<QuranBloc>(context);
    super.initState();
  }


  Widget ListQuran(Quran quran){
    return Container(
      color: Colors.white10,
      child: ListView.builder(scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: quran.hasil.length,
        itemBuilder: (context, index) {
        Hasil hasil = quran.hasil[index];

         // return Text("${quran.hasil[index].arti}");
          return Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white
            ),
            child: ListTile(
              onTap: (){setState(() {
                ayat = hasil.ayat;
              });},
              title: Text("${hasil.nama}"),
              trailing: Text("${hasil.asma}"),
              leading: Text("${hasil.nomor}", style: TextStyle(fontSize: 15),),
              subtitle: Text("${hasil.arti}", style: TextStyle(fontSize: 12),),
            ),
          );
        },),
    );
  }
  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("List Quran $ayat"),),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: BlocBuilder<QuranBloc, QuranBlocState>(
          builder: (context, state) {

            if(state is InitQuranState){
              _quranBloc.add(GetListQuranEvent());
              return buildLoading();
            }else{
              Quran quran = (state as GetListState).quran;
              return ListQuran(quran);
            }

          },
        ),
      ),
    );
  }
}
