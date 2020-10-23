import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'events.dart';

void main() => runApp(PlaygroundApp());

class PlaygroundApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plugin Playground',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Playground(title: 'Plugin Playground'),
    );
  }
}

class Playground extends StatefulWidget {
  Playground({Key key, this.title}) : super(key: key);
  final String title;
  @override
  PlaygroundState createState() => PlaygroundState();
}

class PlaygroundState extends State<Playground> {
  static const _channel = const EventChannel('events');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Press button to run playground"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: runPlayground,
        tooltip: 'Run Playground',
        child: Icon(Icons.play_arrow),
      )
    );
  }
  void runPlayground() async {
    _channel.receiveBroadcastStream().listen(_onEvent, cancelOnError: true);
  }
  void _onEvent(dynamic event) {
    print(event);
  }
}
