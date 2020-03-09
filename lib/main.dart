import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:muslimapps/hive_db/Bookmark.dart';
import 'package:muslimapps/hive_db/City.dart';
import 'package:muslimapps/hive_db/ListQuran.dart';
import 'package:muslimapps/ui/ui_login.dart';
import 'bloc/detail_quran/detail_quran_repository.dart';
import 'package:bloc/bloc.dart';
import 'hive_db/ListSurat.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = await HydratedBlocDelegate.build();
  await Hive.initFlutter();
  Hive.registerAdapter<ListQuran>(ListQuranAdapter());
  Hive.registerAdapter<City>(CityAdapter());
  Hive.registerAdapter<Bookmark>(BookmarkAdapter());
  Hive.registerAdapter<ListSurat>(ListSuratAdapter());


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  DetailQuranRepository _detailQuranRepository = DetailQuranRepository();
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Color(0xff6FC6AA),
       //   primarySwatch: Color(0xff6FC6AA),
          hintColor: Color(0xffE4E4E4),
        ),
        debugShowCheckedModeBanner: false,
        home: Container(
            height: double.infinity,
            width: double.infinity,
            child: LoginUi()),
//      )
    );
  }
}