import 'package:flutter/material.dart';
import 'package:flutterappexample/UI_Demo/UI_Tow/pages/profile_page.dart';
class Demo_UI_Two extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Raleway'
      ),
      home: ProfilePage()
    );
  }
}
