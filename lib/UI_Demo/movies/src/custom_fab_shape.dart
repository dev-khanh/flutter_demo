import 'package:flutter/material.dart';
class CustomBorder extends ShapeBorder {
  const CustomBorder();
  @override
  EdgeInsetsGeometry get dimensions {
    return const EdgeInsets.only();
  }
  @override
  Path getInnerPath(Rect rect, { TextDirection textDirection }) {
    return getOuterPath(rect, textDirection: textDirection);
  }
  @override
  Path getOuterPath(Rect rect, { TextDirection textDirection }) {
    return Path()
      ..moveTo(rect.left + rect.width * 0.05, rect.top + rect.height * 0.25)
      ..quadraticBezierTo(rect.left + rect.width / 2.0, rect.top - rect.height * 0.25, rect.right - rect.width * 0.05, rect.top + rect.height * 0.25)
      ..quadraticBezierTo(rect.right + rect.width * 0.35, rect.bottom - rect.height * 0.20, rect.right - rect.width * 0.25, rect.bottom - rect.height * 0.15)
      ..lineTo(rect.left + rect.width * 0.25, rect.bottom - rect.height * 0.15)
      ..quadraticBezierTo(rect.left - rect.width * 0.35, rect.bottom - rect.height * 0.20, rect.left + rect.width * 0.05, rect.top + rect.height * 0.25)
      ..close();
  }
  @override
  void paint(Canvas canvas, Rect rect, { TextDirection textDirection }) {}
  // This border doesn't support scaling.
  @override
  ShapeBorder scale(double t) {
    return null;
  }
}