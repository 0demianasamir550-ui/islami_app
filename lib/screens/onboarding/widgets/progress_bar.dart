import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final VoidCallback onNext;

  const ProgressBar({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 430,
      height: 50,
      child: Stack(
        children: [
          Positioned(
            top: 12,
            left: 150,
            child: Container(
              width: 18,
              height: 7,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(27),
              ),
            ),
          ),
          Positioned(
            top: 12,
            left: 215,
            child: Row(
              children: List.generate(totalPages - 1, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  width: 7,
                  height: 7,
                  decoration: BoxDecoration(
                    color: index == currentPage ? Colors.white : const Color(0xFF707070),
                    shape: BoxShape.circle,
                  ),
                );
              }),
            ),
          ),
          Positioned(
            top: 12,
            right: 20,
            child: GestureDetector(
              onTap: onNext,
              child: Container(
                width: 37,
                height: 30,
                alignment: Alignment.center,
                child: const Text(
                  'Next',
                  style: TextStyle(
                      color: Color(0xFFE2BE7F), fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}