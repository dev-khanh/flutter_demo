import 'package:flutter/material.dart';


class NewSceenGetData extends StatefulWidget{
  NewSceenGetData({Key key, this.mData}) : super(key: key);
  final String mData;
  @override
  State<StatefulWidget> createState() => _NewSceenGetData(mData);
}

class _NewSceenGetData extends State<NewSceenGetData>{
  final double avatarRadius = 50.0;
  String mData;
  _NewSceenGetData(this.mData);
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 3.8;
    var width = MediaQuery.of(context).size.width / 2;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(child: Container(height: height, color: Colors.red,), flex: 1,),
              Expanded(child: _BoderRadisuccssss2(context), flex: 1,)
            ],
          ),
          Positioned(
            child: Stack(
              children: <Widget>[
                CircleAvatar(radius: avatarRadius, backgroundColor: Colors.green),
                Positioned(
                  child: Text(mData),
                  left: 30,
                  top: 40,
                )
              ],
            ),
            left: width - avatarRadius,
            top: height - avatarRadius,
          ),
        ],
      )
    );
  }

}

Widget _BoderRadisuccssss2(BuildContext context){
  return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 30.0),
          child: Text('Duong Quoc Khanh')
      )
  );
}