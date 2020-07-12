import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'base.dart';
import 'counter.dart';
import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Provider(
        create: (_) => GlobalBloc(),
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                HomePage(),
                CounterPage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
