import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SebhaScreen(),
  ));
}

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  int count = 0;
  int sentenceIndex = 0;

  final List<String> sentences = [
    'سبحان الله',
    'الحمدلله',
  ];

  void _incrementCounter() {
    setState(() {
      count++;
      if (count % 30 == 0) {
        sentenceIndex = (sentenceIndex + 1) % sentences.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // الخلفية
          Positioned.fill(
            child: Image.asset(
              'assets/images/two.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Container(color: Colors.black.withOpacity(0.6)),

          // صورة Islami + المسجد
          Positioned(
            top: 30,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Image.asset(
                  'assets/images/mosque.png',
                  width: 200,
                  height: 100,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Islami',
                  style: TextStyle(
                    color: Color(0xFFFFD482),
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // الجملة تحت Islami
          const Positioned(
            top: 217,
            left: 58,
            child: SizedBox(
              width: 316,
              height: 67,
              child: Center(
                child: Text(
                  'سبح اسم ربك الأعلى',
                  style: TextStyle(
                    fontFamily: 'Janna LT',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),

          // السبحه الدائرة الكبيرة
          Positioned(
            top: 300,
            left: 26,
            child: GestureDetector(
              onTap: _incrementCounter,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/images/sebhabody.png',
                    width: 379,
                    height: 460,
                  ),
                  Positioned(
                    top: 0,
                    left: 67,
                    child: Image.asset(
                      'assets/images/part_sebha.png',
                      width: 145,
                      height: 86,
                    ),
                  ),
                  Positioned(
                    top: 150,
                    child: Text(
                      sentences[sentenceIndex],
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 100,
                    child: Text(
                      '$count',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}