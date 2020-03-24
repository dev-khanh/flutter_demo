import 'package:flutter/material.dart';

class Calculator_Animation extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _MyAppState();
}
class _MyAppState extends State<Calculator_Animation> with SingleTickerProviderStateMixin{
  double age = 0.0;
  var _SelectedYear;
  Animation _animation;
  AnimationController _animationController;
  @override
  Widget build(BuildContext context) {
    setState(() {
      _SelectedYear = null;
    });
    return Scaffold(body: new Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new OutlineButton(
            child: new Text(_SelectedYear != null ? _SelectedYear.toString() : "choose year"),
            borderSide: new BorderSide(color: Colors.black, width: 3.0),
            color: Colors.white,
            onPressed: _showPiker
          ),
          new Padding(padding: const EdgeInsets.all(20.0)),
          new Text('Duong Quoc khanh ${_animation.value.toStringAsFixed(0)}', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic))
        ],
      )
    ),);
  }
  @override
  void initState() {
    _animationController = new AnimationController(vsync: this, duration: new Duration(milliseconds: 1500));
    _animation = _animationController;
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
  }
  void _showPiker(){
    showDatePicker(context: context, firstDate: new DateTime(1900), initialDate: new DateTime(2020), lastDate: DateTime.now()).then((DateTime dt){
      setState(() {
        _SelectedYear = dt.year;
        calculateAge();
      });
    });
  }
  void calculateAge(){
    setState(() {
      age = (2020 - _SelectedYear).toDouble();
      _animation = new Tween<double>(begin: _animation.value, end: age).animate(new CurvedAnimation(parent: _animationController, curve: Curves.fastOutSlowIn));
      _animation.addListener((){
        setState(() {});
      });
      _animationController.forward();
    });
  }
}