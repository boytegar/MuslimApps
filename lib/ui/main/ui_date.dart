import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:muslimapps/helper/SizeConfig.dart';

class DateUi extends StatefulWidget {
  @override
  _DateUiState createState() => _DateUiState();
}

class _DateUiState extends State<DateUi> {
  DateTime _curDate = DateTime.now();
  List<String> data_widget = [];

//dd, '/', mm, '/', yyyy, ' ', HH, ':', nn

  Widget _CalendarUi(double ratio) {
    return CalendarCarousel<Event>(
      width: double.infinity,
      height: ratio * 125,
      onDayPressed: (DateTime dateTime, List<Event> list) {
        setState(() {
          data_widget.clear();
          for (var i = 0; i <= 10; i++) {
            data_widget.add(formatDate(_curDate, [HH, ':', nn]));
          }
          _curDate = dateTime;
        });
      },
      //  minSelectedDate: DateTime.now(),
//      maxSelectedDate: ,
      firstDayOfWeek: 1,
      daysHaveCircularBorder: false,
      selectedDayBorderColor: Colors.white,
      todayBorderColor: Colors.white,
      todayButtonColor: Colors.white,
      weekendTextStyle:
          TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      prevDaysTextStyle: TextStyle(color: Color(0x88ffffff)),
      nextDaysTextStyle: TextStyle(color: Color(0x88ffffff)),
      selectedDateTime: _curDate,
      selectedDayButtonColor: Color(0xff74C6EF),
      //  thisMonthDayBorderColor: Color(0xff74C6EF),
      markedDateCustomShapeBorder: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(18.0),
      ),
      markedDateMoreCustomDecoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10)),
      selectedDayTextStyle: TextStyle(color: Colors.white),
      weekdayTextStyle: TextStyle(color: Colors.white),
      todayTextStyle: TextStyle(color: Theme.of(context).primaryColor),
      daysTextStyle: TextStyle(color: Colors.white),
      iconColor: Colors.white,
      headerTextStyle: TextStyle(color: Colors.white, fontSize: ratio * 7),


      onDayLongPressed: (DateTime dateTime) {},
    );
  }

  @override
  void initState() {
    for (var i = 0; i <= 10; i++) {
      data_widget.add(formatDate(_curDate, [HH, ':', nn]));
    }
    super.initState();
  }

  Widget _listAct(double ratio, String text) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 11),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(fontSize: ratio * 5, color: Colors.black45),
          ),
          SizedBox(
            height: ratio * 5,
          ),
          Text(
            "Lorem Ipsum lolwh wkent hfksjda whewken glaks hwelksm qkenqwus dkadsn",
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: ratio * 5, color: Colors.black87),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double ratio = SizeConfig.screenRatio;

//    for(var i = 0; i<=10; i++){
//      data_widget.add(_curDate.toString()+" = "+i.toString());
//    }
    return Container(
      color: Color(0xffF7F6F9),
      margin: EdgeInsets.all(ratio * 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: SizeConfig.paddingTop,
          ),
          SizedBox(
            height: 4,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  "CALENDAR",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: ratio * 8,
                      fontWeight: FontWeight.bold),
                ),
//                Row(
//                  mainAxisSize: MainAxisSize.min,
//                  children: <Widget>[
//                    GestureDetector(
//                      child: Container(
//                        padding: EdgeInsets.only(right: 10),
//                          child: Text("Masehi")),
//                    ),
//                    GestureDetector(
//                      child: Container(
//                          padding: EdgeInsets.only(left: 10),
//                          child: Text("Hijriah")),
//                    )
//                  ],
//                )
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Theme.of(context).primaryColor,
                        Color(0xff74C6EF)
                      ])),
              padding: EdgeInsets.all(10),
              child: _CalendarUi(ratio),
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: data_widget.length,
              // ignore: missing_return
              itemBuilder: (context, index) {
                return _listAct(ratio, data_widget[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}
