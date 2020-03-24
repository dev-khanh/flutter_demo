import 'package:flutter/material.dart';

class SecondRoute extends StatelessWidget {
  //  static const routeName = '/extractArguments';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
            print('ssss');
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}