import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Call_GPS extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _state_Call_GPS();
}
class _state_Call_GPS extends State<Call_GPS> {
  static MethodChannel methodChannel = MethodChannel('plugins.flutter.io/initGPS');
  bool check = false;
  String text = 'Start';
  Color color = Colors.green;
  @override
  void initState() {
    methodChannel.invokeMethod('initGPS');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'GPS Plugin Demo',
        home: Scaffold(
          appBar: AppBar(title: Text('GPS Demo')),
          body: Center(child: RaisedButton(onPressed: () => _setOnClickStartGPS(), color: color, child: Text(text))),
        )
    );
  }
  _setOnClickStartGPS(){
    setState(() {
      check = !check;
    });
    if(check){
      methodChannel.invokeMethod('startGPS');
      setState(() {
        text = 'Stop';
        color = Colors.red;
      });
    }else{
      methodChannel.invokeMethod('stopGPS');
      setState(() {
        text = 'Start';
        color = Colors.green;
      });
    }
  }
}