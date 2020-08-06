import 'package:flutter/material.dart';
import 'package:flutterappexample/stream/stream_broadcast.dart';

class DemoStream extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<DemoStream> {
  StreamBroadCast _streamBroadCast = StreamBroadCast();
  @override
  Widget build(BuildContext context) {
    _streamBroadCast.streamControll.listen((event) {
      print("DEVK datsssa: " + event.hashCode.toString());
    });
    return Scaffold(
      body: Center(
        child: StreamBuilder<int>(
          stream: _streamBroadCast.streamControll,
          builder: (context, snapshost){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  snapshost.hasData ? snapshost.data.toString() : '',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  void _incrementCounter() {
    _streamBroadCast.setOnClick();
  }
}
