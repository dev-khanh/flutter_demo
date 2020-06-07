import 'package:flutter/material.dart';
import 'package:flutterappexample/UI_Demo/UI_Tow/styleguide/colors.dart';

class OpaqueImage extends StatelessWidget {

  final imageUrl;

  const OpaqueImage({Key key, @required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          imageUrl,
          width: double.maxFinite,
          height: double.maxFinite,
          fit: BoxFit.fill,
        ),
        Container(
          color: primaryColorOpacity.withOpacity(0.85),
        ),
      ],
    );
  }
}
