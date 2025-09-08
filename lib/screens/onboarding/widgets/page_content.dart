import 'package:flutter/material.dart';
import 'centered_image.dart';

class PageContent extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const PageContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CenteredImage(imagePath: image),
        const SizedBox(height: 30),
        Text(
          title,
          style: const TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Text(
            description,
            style: const TextStyle(color: Colors.white70, fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}