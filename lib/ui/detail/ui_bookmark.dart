import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:muslimapps/hive_db/Bookmark.dart';

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
        title: Text(
          "List Bookmark",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: FutureBuilder(
        future: Hive.openBox("bookmark"),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var list_data = Hive.box("bookmark");
            if (list_data.length == 0) {
              return Center(
                child: Text("Belum Ada Data"),
              );
            } else {
              return ListView.builder(
                itemBuilder: (context, index) {
                  Bookmark bookmark = list_data.getAt(index);
                  return Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: ListTile(
                      title: Text(
                          bookmark.nama + " - " + bookmark.ayat.toString()),
                      leading: Container(
                          padding: EdgeInsets.all(5),
                          child: Text("${index + 1}")),
                    ),
                  );
                },
                itemCount: list_data.length,
              );
            }
          } else {
            return Center(
              child: Text("Error Connection"),
            );
          }
        },
      ),
    );
  }
}
