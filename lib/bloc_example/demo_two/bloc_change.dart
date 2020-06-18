import 'dart:ui';
import 'package:flutter/material.dart';
import 'bloc_chang_state.dart';

class BlocChang extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StateBlocChang();
}

class _StateBlocChang extends State<BlocChang> {
  bool mCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder(
          initialData: "...",
          stream: changState.stream,
          builder: (context, hasdata) {
            return Text(
              hasdata.data,
              style: TextStyle(color: Colors.red, fontSize: 50.0),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            mCheck = !mCheck;
          });
          mCheck ? changState.feedBlocData("Khanh") : changState.feedBlocData("...");
        },
        child: Text("Red"),
      ),
    );
  }
}
