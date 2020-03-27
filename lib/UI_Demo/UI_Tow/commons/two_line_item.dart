import 'package:flutter/material.dart';
import 'package:flutterappexample/UI_Demo/UI_Tow/styleguide/text_style.dart';

class TwoLineItem extends StatelessWidget {
  final String firstText, secondText;

  const TwoLineItem({Key key, @required this.firstText, @required this.secondText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          firstText,
          style: titleStyle,
        ),
        Text(
          secondText,
          style: subTitleStyle,
        ),
      ],
    );
  }
}
