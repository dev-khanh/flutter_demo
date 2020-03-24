import 'package:flutter/material.dart';
import 'ExtractArgumentsScreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("Button Click"),
              color: Colors.amberAccent,
              onPressed: () {
                Navigator.pushNamed(context, 'DEVK', arguments: ScreenArguments('Messges.'));
              },
            ),
          ],
        ),
      ),
    );
  }
}
