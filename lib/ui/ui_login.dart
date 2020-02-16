import 'package:flutter/material.dart';
import 'package:market_app/helper/SizeConfig.dart';

//ctrl + space for show suggestion

class LoginUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LoginPage(), debugShowCheckedModeBanner: false);
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String texts = "";
  TextEditingController emailController;
  TextEditingController passController;
  bool _value1 = false;

  final List<IconData> icons = [
    Icons.sentiment_very_dissatisfied,
    Icons.home,
    Icons.drafts
  ];

  @override
  void initState() {
    emailController = TextEditingController();
    passController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void subtractNumbers() {
    setState(() {
      texts = emailController.text + " - " + passController.text;
    });
  }

  Widget _entryField(double ratios, String title, bool isPassword) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(3 * ratios)),
          border: Border.all(width: 1, color: Colors.black12),
          color: Colors.white),
      child: TextField(
          controller: (isPassword) ? passController : emailController,
          style: new TextStyle(fontSize: 6 * ratios, color: Colors.black),
          obscureText: isPassword,
          decoration: InputDecoration(
              prefixIcon: (isPassword) ? Icon(Icons.lock) : Icon(Icons.mail),
              border: InputBorder.none,
              // fillColor: Color(0xfff3f3f4),
              labelText: title,
              filled: true)),
    );
  }

  Widget _listBtn(double ratio) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: ratio * 18,
          height: ratio * 18,
          child: Center(
            child: RaisedButton(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(ratio * 3),
                ),
                color: Theme.of(context).primaryColor,
                padding: EdgeInsets.all(ratio * 4),
                child: new IconTheme(
                  data: new IconThemeData(color: Colors.white),
                  child: new Icon(Icons.add),
                ),
                onPressed: () {}),
          ),
        ),
        SizedBox(
          width: ratio * 4.5,
        ),
        Container(
          width: ratio * 18,
          height: ratio * 18,
          child: Center(
            child: RaisedButton(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(ratio * 3),
                ),
                color: Theme.of(context).primaryColor,
                padding: EdgeInsets.all(ratio * 4),
                child: new IconTheme(
                  data: new IconThemeData(color: Colors.white),
                  child: new Icon(Icons.transfer_within_a_station),
                ),
                onPressed: () {}),
          ),
        ),
        SizedBox(
          width: ratio * 4.5,
        ),
        Container(
          width: ratio * 18,
          height: ratio * 18,
          child: Center(
            child: RaisedButton(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(ratio * 3),
                ),
                color: Theme.of(context).primaryColor,
                padding: EdgeInsets.all(ratio * 4),
                child: new IconTheme(
                  data: new IconThemeData(color: Colors.white),
                  child: new Icon(Icons.person),
                ),
                onPressed: () {}),
          ),
        ),
      ],
    );
  }

  Widget _loginBtn(double ratio) {
    return ButtonTheme(
      minWidth: double.infinity,
      child: RaisedButton(
        elevation: 5,
        onPressed: subtractNumbers,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(ratio * 3),
        ),
        color: Theme.of(context).primaryColor,
        padding: EdgeInsets.all(ratio * 4),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: ratio * 2,
            ),
            new Text(
              "Login",
              style: TextStyle(fontSize: ratio * 7),
            ),
            SizedBox(
              height: ratio * 2,
            ),
          ],
        ),
      ),
    );
  }

  Widget _infos(double ratio) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Checkbox(
                  value: _value1,
                  onChanged: (newValue) {
                    setState(() {
                      if (_value1) {
                        _value1 = newValue;
                      } else {
                        _value1 = newValue;
                      }
                    });
                  },
                ),
                Text(
                  "Remember Me",
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ],
            ),
          ),
          Text(
            "Forgot Password?",
            style: TextStyle(color: Theme.of(context).primaryColor),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom/2.5),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            _entryField(SizeConfig.screenRatio, "title", false),
                            _entryField(SizeConfig.screenRatio, "Password", true),
                          ],
                        ),
                      ),
                      _infos(SizeConfig.screenRatio),
                      _loginBtn(SizeConfig.screenRatio),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "OR CONNECTED",
                        style: TextStyle(color: Colors.black12),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      _listBtn(SizeConfig.screenRatio)
                    ],
                  ),
                ),
            
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
                margin: EdgeInsets.only(top: SizeConfig.screenRatio * 30),
                width: SizeConfig.screenWidth / 3 * 2,
                child: Image.asset("assets/images/logo.png")),
          )
        ],
      ),
    );
  }
}
