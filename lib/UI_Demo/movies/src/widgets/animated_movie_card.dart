import 'package:flutter/material.dart';
class AnimatedMovieCard extends StatelessWidget {
  final Widget content;
  final double scale;
  AnimatedMovieCard({this.content, this.scale});
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: content,
    );
  }
}





