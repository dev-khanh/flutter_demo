import 'package:flutter/material.dart';

class Lifecyle_Handling_Orientation extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _MyAppState();
}
class _MyAppState extends State<Lifecyle_Handling_Orientation> with WidgetsBindingObserver{
  AppLifecycleState _appLifecycleState;
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      _appLifecycleState = state;
      print("DEVK myApp $_appLifecycleState");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(_appLifecycleState.toString(), style: TextStyle(fontSize: 50.0),)));
  }
}