import 'package:flutter/material.dart';

class CenteredImage extends StatelessWidget {
  final String imagePath;

  const CenteredImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      height: 300,
      fit: BoxFit.contain,
    );
  }
}