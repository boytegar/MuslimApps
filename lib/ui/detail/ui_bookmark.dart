import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
class BookmarkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BookmarkUI();
  }
}
class BookmarkUI extends StatefulWidget {
  @override
  _BookmarkUIState createState() => _BookmarkUIState();
}

class _BookmarkUIState extends State<BookmarkUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Bookmark", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: FutureBuilder(
        future: Hive.openBox("bookmark"),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            var list_data = Hive.box("bookmark");
            if(list_data.length == 0){
              return Center(
                child: Text("Belum Ada Data"),
              );
            }else{
              return ListView.builder(
                itemBuilder:  (context, index){
                  return ListTile(

                  );
                },
              itemCount: list_data.length,

              );
            }
          }else{
            return Center(
              child: Text("Error Connection"),
            );
          }
        },
      ),
    );
  }
}

