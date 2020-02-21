import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/bloc/quran/QuranBloc.dart';
import 'package:market_app/bloc/quran/QuranBlocEvent.dart';
import 'package:market_app/bloc/quran/QuranBlocState.dart';
import 'package:market_app/model/Quran.dart';
import 'package:shimmer/shimmer.dart';

class QuranUi extends StatefulWidget {
  @override
  _QuranUiState createState() => _QuranUiState();
}

class _QuranUiState extends State<QuranUi> {

  QuranBloc _quranBloc;

  String ayat = "";

  @override
  void dispose() {
  //  _quranBloc?.close();
    super.dispose();
    //_quranBloc.add(initQuranEvent());

  }

  @override
  void initState() {
    _quranBloc = BlocProvider.of<QuranBloc>(context);
    super.initState();
  }


  Widget ListQuran(Quran quran){
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {
          _quranBloc.add(GetListQuranEvent());
        });
      },
      child: Container(
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
                onTap: () {
                  setState(() {
                    ayat = hasil.ayat;
                  });
                },
                title: Text("${hasil.nama}"),
                trailing: Text("${hasil.asma}"),
                leading: Text(
                  "${hasil.nomor}", style: TextStyle(fontSize: 15),),
                subtitle: Text(
                  "${hasil.arti}", style: TextStyle(fontSize: 12),),
              ),
            );
          },),
      ),
    );
  }
  Widget buildLoading() {
    return Container(
        padding: EdgeInsets.all(25.0),
        child:Center(
          child: Shimmer.fromColors(
              direction: ShimmerDirection.ltr,
              // period: Duration(seconds:3),
              child: Column(
                children: [0, 1, 2, 3,4,5,6,7,8]
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

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("List Quran"),),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: BlocBuilder<QuranBloc, QuranBlocState>(
          bloc: _quranBloc,
          builder: (context, state) {

            if(state is InitQuranState){
              Future.delayed(const Duration(seconds: 3), () {
                _quranBloc.add(GetListQuranEvent());
              });
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
