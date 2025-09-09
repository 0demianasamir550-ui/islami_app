import 'package:flutter/material.dart';

class TopHeader extends StatelessWidget {
  const TopHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          'assets/images/mosque.png',
          width: 291,
          height: 151,
          fit: BoxFit.contain,
        ),
        Positioned(
          top: 75,
          child: ShaderMask(
            shaderCallback: (Rect bounds) {
              return const LinearGradient(
                colors: [Color(0xFFC0A37C), Color(0xFFFFD482)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ).createShader(bounds);
            },
            child: const Text(
              'Islami',
              style: TextStyle(
                fontFamily: 'Kamali',
                fontWeight: FontWeight.w400,
                fontSize: 80,
                height: 1.0,
                letterSpacing: 0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}