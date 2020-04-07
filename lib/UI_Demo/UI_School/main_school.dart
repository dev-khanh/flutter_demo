import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class Main_school extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => setStateSchool();
}
class setStateSchool extends State<Main_school>{
  List<String> _months = ["--Chọn lớp--","Lớp 1", "Lớp 2"].toList();
  String _selectedMonth = '--Chọn lớp--';
  String img = "assets/images/school/Background 3.jpg";
  bool checkImages = false;
  @override
  void initState(){
    super.initState();
    _selectedMonth = _months.first;
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays ([]);

    double widths = MediaQueryData.fromWindow(window).size.width;
    double heights = MediaQueryData.fromWindow(window).size.height;

    return MaterialApp(
      title: "Home",
      home: new Scaffold(
        body: Container(
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage(img), fit: BoxFit.fill)),
          child: Stack(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          SizedBox(width: 500, height: 20,),
                          Container(
                            decoration: new BoxDecoration(
                              color:Colors.indigoAccent.withOpacity(0.9),
                              borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                            ),
                            width: 300, height: 150,
                            padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
                            alignment: Alignment.center,
                            child: Column(
                              children: <Widget>[
                                SizedBox(width: 500, height: 0,),
                                Text('Thông tin cá nhân', style: TextStyle(fontSize: 18.0, color: Colors.orange, fontWeight: FontWeight.bold),),
                                TextFormField(
                                    decoration: InputDecoration(
                                        hintText: 'Tên đăng nhập',
                                        hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),
                                        fillColor: Colors.red, labelStyle: new TextStyle(color: Colors.red)
                                    )),
                                DropdownButton<String>(
                                    isExpanded: true,
                                    value: _selectedMonth,
                                    focusColor: Colors.orange,
                                    items: _months.map((String value){
                                      return new DropdownMenuItem(
                                          value: value,
                                          child: new Text("${value}", style: TextStyle(fontSize: 20.0, color: Colors.red),)
                                      );
                                    }).toList(),
                                    onChanged: (String value){
                                      onMonthChange(value);
                                    }
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  )
//                  RaisedButton(onPressed: (){}, child: null,)
                ],
              ),
              Positioned(child: Image.asset("assets/images/school/back.png", width: 40, height: 40), top: 10, left: 10,),
              Positioned(child: checkImages ? mWidget : Text(''), bottom: 7, left: 300,)
            ],
          ),
        ),
      ),
    );
  }
  Widget mWidget = Row(
    children: <Widget>[
      Text('Tiếp tục', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      SizedBox(width: 20,),
      Image.asset("assets/images/school/next 2.png", width: 30, height: 30)
    ]
  );
  void onMonthChange(String item){
    setState(() {
      _selectedMonth = item;
    });
    if(_selectedMonth.endsWith("Lớp 1")){
      setState(() {
        img = "assets/images/school/Background 3_1.jpg";
        checkImages = true;
      });
    }else if(_selectedMonth.endsWith("Lớp 2")){
      setState(() {
        img = "assets/images/school/Background 3_2.jpg";
        checkImages = true;
      });
    }else{
      setState(() {
        img = "assets/images/school/Background 3.jpg";
        checkImages = false;
      });
    }
  }
}
