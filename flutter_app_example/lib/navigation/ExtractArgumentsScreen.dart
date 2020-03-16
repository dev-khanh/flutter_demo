import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExtractArgumentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text("khanh")),
      body: Center(child: Text(args.message)),
    );
  }
}
class ScreenArguments {
  final String message;
  ScreenArguments(this.message);
}