import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterappexample/UI_Demo/UI_Tow/commons/radial_progress.dart';
import 'package:flutterappexample/UI_Demo/UI_Tow/commons/rounded_image.dart';
import 'package:flutterappexample/UI_Demo/UI_Tow/styleguide/text_style.dart';

class MyInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RadialProgress(
            width: 4,
            goalCompleted: 0.9,
            child: RoundedImage(
              imagePath: "assets/images/anne.jpeg",
              size: Size.fromWidth(120.0),
            ),
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Anne Grethe",
                style: whiteNameTextStyle,
              ),
              Text(
                ", 24",
                style: whiteNameTextStyle,
              ),
            ],
          ),
          SizedBox(height: 10,),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/icons/location_pin.png",
                  width: 20.0,
                  color: Colors.white,
                ),
                Text(
                  "  34 kilometers",
                  style: whiteSubHeadingTextStyle,
                )
              ],
          ),
        ],
      ),
    );
  }
}
