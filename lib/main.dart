import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:market_app/bloc/home/bloc.dart';
import 'package:market_app/ui/ui_login.dart';
import 'bloc/quran/QuranBloc.dart';
import 'package:bloc/bloc.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = await HydratedBlocDelegate.build();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.



  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<QuranBloc>(
          create: (BuildContext context) => QuranBloc(),
        ),
        BlocProvider<HomeBloc>(
          create: (BuildContext context) => HomeBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          hintColor: Color(0xffE4E4E4),

        ),
        debugShowCheckedModeBanner: false,
        home: Container(
            height: double.infinity,
            width: double.infinity,
            child: LoginUi()),
      )
    );
  }
}