import 'package:flutter/material.dart';

import 'new_sceen_get_data.dart';

class TestSendImage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: RaisedButton(
            onPressed: ()=>_setOnClickItem(context),
            color: Colors.green,
            child: Text('Button'),
          ),
        )
    );
  }
  _setOnClickItem(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context) => NewSceenGetData(mData: "DEVK")));
  }
}