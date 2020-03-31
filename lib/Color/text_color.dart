import 'package:flutter/material.dart';

import 'rainbow_text.dart';

class Text_Color extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: RainbowText(colors: [
              Color(0xFFFF2B22),
              Color(0xFFFF7F22),
              Color(0xFFEDFF22),
              Color(0xFF22FF22),
              Color(0xFF22F4FF),
              Color(0xFF5400F7),
            ], text: "Welcome to BBT", loop: true,)
        )
    );
  }
}