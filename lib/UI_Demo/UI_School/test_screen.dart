import 'package:flutter/material.dart';
class Test_Screen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => setState_Test_Screen();
}
class setState_Test_Screen extends State<Test_Screen> {
  List<String> _months = ["--Chọn lớp--","Lớp 1", "Lớp 2"].toList();
  String _selectedMonth = '--Chọn lớp--';
  @override
  void initState(){
    super.initState();
    _selectedMonth = _months.first;
  }
  @override
  Widget build(BuildContext context) {
    void onMonthChange(String item){
      setState(() {
        _selectedMonth = item;
      });
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: new BoxDecoration(
            color:Colors.deepPurple,
            borderRadius: const BorderRadius.all(Radius.circular(30.0)),
          ),
          padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
//          color: Colors.deepPurple,
          alignment: Alignment.center,

          child: Column(
            children: <Widget>[
              SizedBox(width: 500, height: 0,),
              Text('Thông tin cá nhân', style: TextStyle(fontSize: 18.0, color: Colors.red),),
              TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Tên đăng nhập',
                      hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),
                      fillColor: Colors.red, labelStyle: new TextStyle(color: Colors.red)
                  )),
              DropdownButton<String>(
                isExpanded: true,
                value: _selectedMonth,
                items: _months.map((String value){
                  return new DropdownMenuItem(
                      value: value,
                      child: new Text("${value}", style: TextStyle(fontSize: 20.0, color: Colors.white),)
                  );
                }).toList(),
                onChanged: (String value){
                  onMonthChange(value);
                }
              ),
            ],
          ),
        )
      ),
    );
  }
}

