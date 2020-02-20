import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/bloc/quran/QuranBloc.dart';
import 'package:market_app/bloc/quran/QuranBlocState.dart';
import 'package:market_app/model/Quran.dart';

class QuranUi extends StatefulWidget {
  @override
  _QuranUiState createState() => _QuranUiState();
}

class _QuranUiState extends State<QuranUi> {

  QuranBloc _quranBloc;

  @override
  void dispose() {
    super.dispose();
    _quranBloc?.close();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List Quran"),),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: BlocBuilder<QuranBloc, QuranBlocState>(
          builder: (context, state) {
            int data_length = (state as GetListState).quran.hasil.length;
            List<Hasil> list_quran = (state as GetListState).quran.hasil;

            return Container(
              child: ListView.builder(scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: data_length,
                // ignore: missing_return
                itemBuilder: (context, index) {
                  return Text("${list_quran[index].arti}");
                },),
            );
          },
        ),
      ),
    );
  }
}
