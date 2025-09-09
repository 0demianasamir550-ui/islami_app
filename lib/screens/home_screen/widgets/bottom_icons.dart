import 'package:flutter/material.dart';

class BottomIcons extends StatelessWidget {
  final void Function(String) onIconPressed;
  const BottomIcons({super.key, required this.onIconPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80, // ارتفاع البوتوم
      color: const Color(0xFFE2BE7F), // لون الخلفية
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround, // توزيع متساوي للأيقونات
        crossAxisAlignment: CrossAxisAlignment.center,   // توسيط رأسي
        children: [
          GestureDetector(
            onTap: () => onIconPressed('moon'),
            child: Image.asset(
              'assets/icons/ic_moon.png',
              width: 30,
              height: 30,
            ),
          ),
          GestureDetector(
            onTap: () => onIconPressed('book'),
            child: Image.asset(
              'assets/icons/ic_book.png',
              width: 30,
              height: 30,
            ),
          ),
          GestureDetector(
            onTap: () => onIconPressed('sebha'),
            child: Image.asset(
              'assets/icons/ic_sebha.png',
              width: 30,
              height: 30,
            ),
          ),
          GestureDetector(
            onTap: () => onIconPressed('radio'),
            child: const Icon(
              Icons.radio,
              size: 30,
              color: Colors.black,
            ),
          ),
          GestureDetector(
            onTap: () => onIconPressed('time'),
            child: Image.asset(
              'assets/icons/ic_time.png',
              width: 30,
              height: 30,
            ),
          ),
        ],
      ),
    );
  }
}