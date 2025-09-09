import 'package:flutter/material.dart';
import '../screens/home_screen/widgets/bottom_icons.dart';
import 'ayah_screen.dart';
import 'package:flutter/services.dart' show rootBundle;

class SurahDetailScreen extends StatefulWidget {
  final int surahNumber;
  final String surahEnglishName;
  final String surahArabicName;
  final String verses;
  final String backgroundImage;

  const SurahDetailScreen({
    Key? key,
    required this.surahNumber,
    required this.surahEnglishName,
    required this.surahArabicName,
    required this.verses,
    required this.backgroundImage,
  }) : super(key: key);

  @override
  State<SurahDetailScreen> createState() => _SurahDetailScreenState();
}

class _SurahDetailScreenState extends State<SurahDetailScreen> {
  late String currentImage;

  @override
  void initState() {
    super.initState();
    currentImage = widget.backgroundImage;
  }

  Future<String> readSurahFile(int surahNumber) async {
    try {
      String content =
      await rootBundle.loadString('assets/Suras/$surahNumber.txt');
      return content;
    } catch (e) {
      return 'impty';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              currentImage,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) =>
                  Container(color: const Color(0xFF202020)),
            ),
          ),
          Container(color: Colors.black.withOpacity(0.3)),
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
                  errorBuilder: (_, __, ___) => const SizedBox.shrink(),
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
          Positioned(
            top: 190,
            left: 20,
            right: 20,
            child: Container(
              height: 55,
              decoration: BoxDecoration(
                color: const Color(0xB3202020),
                border: Border.all(color: const Color(0xFFE2BE7F), width: 1),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 12),
                  Image.asset(
                    'assets/icons/ic_moon.png',
                    width: 30,
                    height: 30,
                    color: Colors.yellow,
                    errorBuilder: (_, __, ___) => const SizedBox.shrink(),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    widget.surahArabicName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 270,
            left: 20,
            right: 20,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () async {
                    String ayahContent =
                    await readSurahFile(widget.surahNumber);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => AyahScreen(
                          englishName: widget.surahEnglishName,
                          arabicName: widget.surahArabicName,
                          ayahContent: ayahContent,
                        ),
                      ),
                    );
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'assets/images/big_star.png',
                        width: 70,
                        height: 70,
                        errorBuilder: (_, __, ___) =>
                            Container(width: 70, height: 70, color: Colors.black26),
                      ),
                      Text(
                        '${widget.surahNumber}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.surahEnglishName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.verses,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  widget.surahArabicName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 80,
              color: const Color(0xFFE2BE7F),
              child: BottomIcons(
                onIconPressed: (imagePath) {
                  setState(() {
                    currentImage = imagePath;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}