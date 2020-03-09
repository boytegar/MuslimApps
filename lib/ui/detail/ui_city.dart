import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class CityUi extends StatefulWidget {
  @override
  _CityUiState createState() => _CityUiState();
}

class _CityUiState extends State<CityUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        title: Text("Silahkan Pilih Kota", style: TextStyle(color: Colors.white),),
      ),
      body: FutureBuilder(
        future: Hive.openBox("city"),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var list_city = Hive.box("city");
            if (list_city.length == 0) {
              return Center(
                child: Text("Data Belum Ada"),
              );
            } else {
              return ListView.builder(
                  itemCount: list_city.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Container();
                  });
            }
          } else {
            return Center(child: Text("Error"));
          }
        },
      ),
    );
  }
}
