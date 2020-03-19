import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';
import 'lo_gin.dart';

class MainScreens extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _setStateMyApp();
}
class _setStateMyApp extends State<MainScreens>{
  String _email;
  @override
  void initState(){
    super.initState();
    init();
  }
  @override
  Widget build(BuildContext context) {
    print('DEVK: ${_email}');

    return Scaffold(body: _email == null ? Login() : Home());
  }
  init() async {
    final getStringData = await createOrderMessage();
    setState(() {
      _email = getStringData;
    });
  }
}
Future<String> createOrderMessage() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String email = prefs.getString('DEVK');
  return email;
}
