import 'dart:io';
import 'package:flutter/material.dart';
class TextLed extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<TextLed> with TickerProviderStateMixin {
  final neonPurple = Color(0xFFbc13fe);
  final neonDarkBlue = Color(0xFF7d12ff);
  final neonNew = Color(0xFFbc13fe);
  AnimationController animation;
  Animation<double> _fadeInFadeOut;
  final Color color = Color(0xFFbc13fe);
  List<String> itemList = ['k', 'h', 'a', 'n', 'h'];
  @override
  void initState() {
    super.initState();
    animation = AnimationController(
      value: this,
      duration: Duration(milliseconds: 200),
    );
    _fadeInFadeOut = Tween<double>(begin: 1.0, end: 0.2).animate(animation);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animation.reverse();
      } else if (status == AnimationStatus.dismissed) {
        sleep(Duration(milliseconds: 200));
        animation.forward();
      }
    });
    animation.forward();
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle strokeStyle = TextStyle(
      letterSpacing: 5,
      fontSize: 50,
      foreground: Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2
        ..color = color,
      fontFamily: "NeonLights",
    );
    TextStyle glowStyle = TextStyle(
      letterSpacing: 5,
      fontSize: 50,
      shadows: [
        BoxShadow(
          color: color,
          blurRadius: 1.0,
          spreadRadius: 1.0,
        ),
        BoxShadow(
          color: color,
          blurRadius: 30.0,
          spreadRadius: 30.0,
        ),
        BoxShadow(
          color: color,
          blurRadius: 30.0,
          spreadRadius: 2.0,
        ),
        BoxShadow(
          color: color,
          blurRadius: 200.0,
          spreadRadius: 200.0,
        ),
      ],
      color: Colors.white,
      fontFamily: "NeonLights",
    );
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Row(

            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              itemList.length,
                  (index) {
                return FadeTransition(
                  opacity: _fadeInFadeOut,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(itemList[index], textAlign: TextAlign.center, style: strokeStyle),
                      Text(itemList[index], textAlign: TextAlign.center, style: glowStyle),
                    ],
                  ),
                );
              },
            ),
          ),
        )
    );
  }
}
