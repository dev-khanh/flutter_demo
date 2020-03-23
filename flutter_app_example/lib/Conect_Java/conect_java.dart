import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Conect_Java extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: PlatformChannel());
  }
}
class PlatformChannel extends StatefulWidget {
  @override
  _PlatformChannelState createState() => _PlatformChannelState();
}
class _PlatformChannelState extends State<PlatformChannel> {
  static const MethodChannel methodChannel = MethodChannel('samples.flutter.io/battery');
  String _batteryLevel = 'No Data';

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(_batteryLevel, key: const Key('Battery level label')),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: RaisedButton(child: const Text('Refresh'), onPressed: _getBatteryLevel),
              ),
            ],
          ),
        ],
      ),
    );
  }
  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await methodChannel.invokeMethod('getBatteryLevel');
      batteryLevel = 'Data Sussecc: $result%.';
    } on PlatformException {
      batteryLevel = 'Failed to get battery level.';
    }
    setState(() {
      _batteryLevel = batteryLevel;
    });
  }
}
