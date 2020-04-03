import 'package:flutter/material.dart';
class StackPosition extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: Colors.red),
            ),
            flex: 1,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: Colors.blue),
            ),
            flex: 2,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: Colors.yellow),
            ),
            flex: 2,
          )
        ],
      )
    );
  }
}