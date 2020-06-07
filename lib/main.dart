import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappexample/UI_Demo/showCard/home_page.dart';
void main() => runApp(MaterialApp(title: 'Navigation Basics', home: MyApp(),));
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}