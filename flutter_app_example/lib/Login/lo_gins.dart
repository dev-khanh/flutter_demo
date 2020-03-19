import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () => _setOnClickLogin(context),
          child: Text('Login'),
        ),
      ),
    );
  }
  _setOnClickLogin(BuildContext context) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', 'useremail@gmail.com');
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext ctx) => Home()));
  }
}