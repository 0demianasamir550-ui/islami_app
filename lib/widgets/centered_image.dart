import 'package:flutter/material.dart';

class CenteredImage extends StatelessWidget {
  final String imagePath;
  final double width;
  final double height;
  final double top;
  final double left;

  const CenteredImage({
    Key? key,
    required this.imagePath,
    required this.width,
    required this.height,
    required this.top,
    required this.left,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: Image.asset(
        imagePath,
        width: width,
        height: height,
      ),
    );
  }
}