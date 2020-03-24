import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'lo_gin.dart';
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initLogin();
    return Scaffold(
      appBar: AppBar( title: Text('Home')),
      body: Center(
        child: RaisedButton(
          onPressed: () => _setOnclickButton(context),
          child: Text('Hone'),
        ),
      ),
    );
  }
  _setOnclickButton(BuildContext context) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('DEVK');
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  }
  initLogin() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('DEVK', 'Home');
  }
}
