import 'package:flutter/material.dart';
import 'package:flutterappexample/JSON/myexample.dart' as generated;

class MainExample extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _SetStateMainExample();
}
class _SetStateMainExample extends State<MainExample>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: generated.GeneratedWidget());
  }
}