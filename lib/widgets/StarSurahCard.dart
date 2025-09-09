import 'package:flutter/material.dart';

class StarSurahCard extends StatelessWidget {
  final int index;
  final String englishName;
  final String arabicName;
  final String verses;
  final VoidCallback onTap;

  const StarSurahCard({
    super.key,
    required this.index,
    required this.englishName,
    required this.arabicName,
    required this.verses,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/images/big_star.png',
                width: 52,
                height: 52,
                errorBuilder: (_, __, ___) => Container(
                  width: 52,
                  height: 52,
                  color: Colors.black26,
                ),
              ),
              Text(
                '${index + 1}',
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ],
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                englishName,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              Text(
                verses,
                style: const TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
            ],
          ),
          const Spacer(),
          Text(
            arabicName,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
    );
  }
}