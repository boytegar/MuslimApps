import 'package:flutter/material.dart';
import 'package:muslimapps/helper/SizeConfig.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:muslimapps/ui/ui_main.dart';
import 'package:permission_handler/permission_handler.dart';
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
  PermissionStatus  status_permission = PermissionStatus.unknown;


  @override
  void initState() {
    emailController = TextEditingController();
    passController = TextEditingController();
    runPermission();
    super.initState();
  }

  void runPermission() async {
    //req Permission
    Map<PermissionGroup, PermissionStatus> permissions =
        await PermissionHandler().requestPermissions([
      PermissionGroup.location,
      PermissionGroup.locationAlways,
      PermissionGroup.locationWhenInUse
    ]);

    //check Permission
    //   PermissionStatus permission = await PermissionHandler().checkPermissionStatus(PermissionGroup.contacts);
    //check service
    // ServiceStatus serviceStatus = await PermissionHandler().checkServiceStatus(PermissionGroup.location);
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

  void routeReplacement() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return MainUi();
    }));
  }

  Widget _entryField(double ratios, String title, bool isPassword) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      // decoration: BoxDecoration(
      //     borderRadius: BorderRadius.all(Radius.circular(3 * ratios)),
      //     border: Border.all(width: 1, color: Colors.black12),
      //     color: Colors.white),
      child: TextField(
          controller: (isPassword) ? passController : emailController,
          style: new TextStyle(fontSize: 5 * ratios, color: Colors.black),
          obscureText: isPassword,
          decoration: InputDecoration(
              prefixIcon: (isPassword)
                  ? Icon(
                      Icons.lock,
                      color: Color(0xffF5A625),
                    )
                  : Icon(
                      Icons.mail,
                      color: Color(0xffEC6059),
                    ),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  )),
              // fillColor: Color(0xfff3f3f4),
              //  labelText: title,
              fillColor: Colors.white,
              hintText: title,
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
                  child: new Icon(FontAwesomeIcons.facebookF),
                ),
                onPressed: () {
                  setState(() {});
                }),
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
                  child: new Icon(FontAwesomeIcons.google),
                ),
                onPressed: () {
                  setState(() {});
                }),
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
                  child: new Icon(FontAwesomeIcons.twitter),
                ),
                onPressed: () {
                  setState(() {});
                }),
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
        onPressed: routeReplacement,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(ratio * 3),
        ),
        color: Theme.of(context).primaryColor,
        padding: EdgeInsets.all(ratio * 4),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: ratio * 1,
            ),
            new Text(
              "Login",
              style: TextStyle(fontSize: ratio * 6),
            ),
            SizedBox(
              height: ratio * 1,
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
                  style: TextStyle(color: Colors.black26),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              "Forgot Password?",
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
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
                          bottom:
                              MediaQuery.of(context).viewInsets.bottom / 2.5),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          _entryField(
                              SizeConfig.screenRatio, "Username", false),
                          _entryField(SizeConfig.screenRatio, "Password", true),
                        ],
                      ),
                    ),
                    _infos(SizeConfig.screenRatio),
                    _loginBtn(SizeConfig.screenRatio),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "OR CONNECTED",
                      style: TextStyle(color: Colors.black12, fontSize: 12),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    _listBtn(SizeConfig.screenRatio),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                        onTap: () {
                          setState(() {});
                        },
                        child: Text(
                          "Dont Have Account? Click Here",
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        )),
                    SizedBox(
                      height: 20,
                    )
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
