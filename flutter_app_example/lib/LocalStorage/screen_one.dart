import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

import 'screen_two.dart';

class Screen_one extends StatelessWidget{
  String key_strong = 'some_key';
  final LocalStorage storage = new LocalStorage('some_key');
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('BottomNavigationBar'), actions: <Widget>[IconButton(icon: Icon(Icons.send), onPressed: (){_onPressedShowButtom(context);})]),
        body: Center(
          child: RaisedButton(
            onPressed: (){storage.setItem(key_strong, 'Screen_Two');},
            child: Text('Increment Counter'),
          ),
        ),
      ),
    );
  }
  _onPressedShowButtom(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Screen_Two())).then((value) {
      debugPrint(value);
      print('DEVK _reload();');
      storage.deleteItem(key_strong);
    });
  }
}