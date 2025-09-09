import 'package:flutter/material.dart';

class AyahScreen extends StatelessWidget {
  final String englishName;
  final String arabicName;
  final String ayahContent;

  const AyahScreen({
    super.key,
    required this.englishName,
    required this.arabicName,
    required this.ayahContent,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: 430,
            height: 932,
            color: const Color(0xFF202020),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: 430,
              height: 80,
              color: const Color(0xFF202020),
            ),
          ),
          Positioned(
            top: 26,
            left: 173,
            child: Text(
              englishName,
              style: const TextStyle(
                fontFamily: 'Janna LT',
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color(0xFFE2BE7F),
              ),
            ),
          ),
          Positioned(
            top: 97,
            left: 182,
            child: Text(
              arabicName,
              style: const TextStyle(
                fontFamily: 'Janna LT',
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color(0xFFE2BE7F),
              ),
            ),
          ),
          Positioned(
            top: 150,
            left: 20,
            right: 20,
            child: Center(
              child: Text(
                ayahContent,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFFFFD482),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Transform.rotate(
                angle: 3.1416, // arrow pointing left
                child: Container(
                  width: 18,
                  height: 18,
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 2, color: Color(0xFFE2BE7F)),
                      right: BorderSide(width: 2, color: Color(0xFFE2BE7F)),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // الصور الموجودة في التصميم
          Positioned(
            top: 89,
            left: 317,
            child: Image.asset(
              'assets/images/design_card.png',
              width: 93,
              height: 92,
              color: const Color(0xFFE2BE7F),
            ),
          ),
          Positioned(
            top: 89,
            left: 18,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(3.1416),
              child: Image.asset(
                'assets/images/design_card.png',
                width: 93,
                height: 92,
                color: const Color(0xFFE2BE7F),
              ),
            ),
          ),
          Positioned(
            top: 820,
            left: 0,
            child: Image.asset(
              'assets/images/mosque_card.png',
              width: 430,
              height: 112,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}