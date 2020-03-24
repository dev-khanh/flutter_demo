import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

class Screen_Two extends StatelessWidget{
  final LocalStorage storage = new LocalStorage('some_key');
  @override
  Widget build(BuildContext context) {
    print("DEVK: get data "+ storage.getItem('some_key').toString());
    storage.ready;
    return Scaffold(body: Text('DDDD'),);
  }
}