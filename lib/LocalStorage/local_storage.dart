import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

import 'screen_one.dart';
import 'screen_two.dart';

class Local_Storage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => setStateMypp();
}
class setStateMypp extends State<Local_Storage>{
  Widget widgetsss;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final LocalStorage storage = new LocalStorage('some_key');
    print("DEVK: Main "+ storage.getItem('some_key').toString());

    setState(() {
      widgetsss = widgetScreenTwo;
    });
    return Scaffold(
        body: widgetsss
    );
  }
  Widget widgetScreenOne = Container(
      child: Screen_one()
  );
  Widget widgetScreenTwo = Container(
      child: Screen_Two()
  );
}