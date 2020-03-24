import 'package:flutter/material.dart';
import 'package:swipe_button/swipe_button.dart';

class Slider_Button extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PacmanSlider()
    );
  }
}
class PacmanSlider extends StatefulWidget {
  @override
  _PacmanSliderState createState() => _PacmanSliderState();
}
class _PacmanSliderState extends State<PacmanSlider> {
  var _swipevalue = true;
  @override
  Widget build(BuildContext context) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Padding(
          padding: EdgeInsets.only(left: 10.0,top: 8.0),
          child: new Text('Trip Status: ', style: new TextStyle(fontSize: 20.0, color: Color(0XFF454f63))),
        ),
        Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0,left: 8.0,right: 8.0),
            child: SwipeButton(
              thumb: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Align(widthFactor: 0.30, child: Icon(_swipevalue ? Icons.chevron_right : Icons.chevron_left, size: 30.0, color: Colors.white)),
                ],
              ),
              content: Center(
                child: Text(_swipevalue ? 'Swipe Right To Start Trip' : 'Swipe Right To Stop Trip', style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold)),
              ),
              onChanged: (result) {
                print(result);
                if(result == SwipePosition.SwipeRight){
                  print('DEVK Success !!!');
                  setState(() {
                    _swipevalue = !_swipevalue;
                    // _logout();
                    // Navigator.of(context).pushReplacementNamed("/home");
                  });
                }else{
                  print('DEVK Error !!!');
                  setState(() {
                    _swipevalue = !_swipevalue;
                    // _logout();
                    // Navigator.of(context).pushReplacementNamed("/home");
                  });
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}