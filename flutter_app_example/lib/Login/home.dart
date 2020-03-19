import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'lo_gins.dart';
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initLogin();
    return Scaffold(
      appBar: AppBar( title: Text('Home')),
      body: Center(
        child: RaisedButton(
          onPressed: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.remove('email');
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext ctx) => Login()));
          },
          child: Text('Hone'),
        ),
      ),
    );
  }
  initLogin() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('DEVK', 'Home');
  }
}
