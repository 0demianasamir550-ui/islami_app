import 'package:flutter/material.dart';

class BottomIcons extends StatelessWidget {
  final void Function(String) onIconPressed;
  const BottomIcons({super.key, required this.onIconPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // icon inside small rounded dark rectangle (left-most)
        Expanded(
          child: Center(
            child: GestureDetector(
              onTap: () => onIconPressed('assets/images/image_one_home.jpg'),
              child: Container(
                width: 59,
                height: 34,
                decoration: BoxDecoration(color: const Color(0xFF202020).withOpacity(0.6), borderRadius: BorderRadius.circular(66)),
                child: Center(
                  child: Image.asset('assets/icons/ic_moon.png', width: 24, height: 24, errorBuilder: (c, e, s) => const Icon(Icons.nightlight_round, color: Color(0xFF202020))),
                ),
              ),
            ),
          ),
        ),

        Expanded(
          child: Center(
              child: GestureDetector(onTap: () => onIconPressed('assets/images/three.jpg'), child: Image.asset('assets/icons/ic_book.png', width: 30, height: 30, errorBuilder: (c, e, s) => const Icon(Icons.book, color: Color(0xFF202020))))),
        ),

        Expanded(
          child: Center(
              child: GestureDetector(onTap: () => onIconPressed('assets/images/two.jpg'), child: Image.asset('assets/icons/ic_sebha.png', width: 30, height: 30, errorBuilder: (c, e, s) => const Icon(Icons.bubble_chart, color: Color(0xFF202020))))),
        ),

        Expanded(
          child: Center(
              child: GestureDetector(onTap: () => onIconPressed('assets/images/four.jpg'), child: const Icon(Icons.radio, size: 30, color: Color(0xFF202020)))),
        ),

        Expanded(
          child: Center(
              child: GestureDetector(onTap: () => onIconPressed('assets/images/one.jpg'), child: Image.asset('assets/icons/ic_time.png', width: 30, height: 30, errorBuilder: (c, e, s) => const Icon(Icons.access_time, color: Color(0xFF202020))))),
        ),
      ],
    );
  }
}