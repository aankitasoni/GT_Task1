import 'package:flutter/material.dart';

class SaveListClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double cutSize = 20;
    return Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width - cutSize, size.height)
      ..lineTo(cutSize, size.height)
      ..close();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
