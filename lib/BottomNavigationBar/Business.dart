import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Business extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return CreateClassState();
  }
}
class CreateClassState extends State<Business>{
  final User user =  new User();
  @override
  Widget build(BuildContext context) {
    final TextField _txtField = new TextField(
      decoration: new InputDecoration(
        hintText: 'Enter your username',
        contentPadding: new EdgeInsets.all(10.0),
        border: InputBorder.none
      ),
      autocorrect: false,
      onChanged: (text){
          setState(() {
            this.user.userName = text;
          });
      },
      keyboardType: TextInputType.text,
    );
    final TextField _txtFieldPass = new TextField(
      decoration: new InputDecoration(
          hintText: 'Enter your password',
          contentPadding: new EdgeInsets.all(10.0),
          border: InputBorder.none
      ),
      autocorrect: false,
      keyboardType: TextInputType.text,
      obscureText: true,
    );
    return Scaffold(
        body: new Column(
//          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              margin: new EdgeInsets.only(left: 20.0, right: 20.0,top: 5.0),
              decoration: new BoxDecoration(
                color: Color.fromARGB(255, 240, 240, 240),
                border: new Border.all(width: 1.2, color: Colors.black12),
                borderRadius: const BorderRadius.all(const Radius.circular(6.0))
              ),
              child: _txtField,
            ),
            new Container(
              margin: new EdgeInsets.only(left: 20.0, right: 20.0,top: 5.0),
              decoration: new BoxDecoration(
                  color: Color.fromARGB(255, 240, 240, 240),
                  border: new Border.all(width: 1.2, color: Colors.black12),
                  borderRadius: const BorderRadius.all(const Radius.circular(6.0))
              ),
              child: _txtFieldPass,
            ),
            new Container(
              margin: new EdgeInsets.only(left: 20.0, right: 20.0,top: 5.0),
              child: new Row(
                children: <Widget>[
                  new Expanded(
                      child: new RaisedButton(
                          color: Colors.blue,
                          textColor: Colors.white,
                          child: Text('Login'),
                          onPressed: () {_setOnClic();},
                      )
                  ),
                ],
              ),
            ),
          ],
        )
    );
  }
  _setOnClic() {
    print('UsertName: ${user.userName}');
  }
}
class User{
  String userName;
  String passWord;
}