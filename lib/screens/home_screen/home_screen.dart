import 'package:flutter/material.dart';
import '../../widgets/quran_card.dart';
import '../../widgets/StarSurahCard.dart';
import 'widgets/bottom_icons.dart';
import '../../data/surah_data.dart';
import '../../Suars/surah_details_screen.dart';
import '../Sebha/sebha_screen.dart';
import '../Radio/radio_screen.dart';
import '../Hadith/hadith_screen.dart'; // شاشة الحديث

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final screens = [
    const HomeContent(), // محتوى Home الأصلي
    const SebhaScreen(),
    const RadioScreen(),
    const HadithScreen(), // شاشة الحديث
  ];

  void onBottomIconPressed(String screen) {
    setState(() {
      if (screen == 'moon' || screen == 'home') {
        currentIndex = 0;
      } else if (screen == 'book') {
        currentIndex = 3; // عرض شاشة الحديث
      } else if (screen == 'sebha') {
        currentIndex = 1;
      } else if (screen == 'radio') {
        currentIndex = 2;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomIcons(onIconPressed: onBottomIconPressed),
    );
  }
}

// محتوى Home الأصلي
class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: const Color(0xFF202020)),
        Positioned.fill(
          child: Container(color: Colors.black.withOpacity(0.4)),
        ),
        Positioned(
          top: 30,
          left: 67,
          child: Image.asset(
            'assets/images/mosque.png',
            width: 299,
            height: 124.51,
            fit: BoxFit.contain,
            errorBuilder: (c, e, s) => const SizedBox.shrink(),
          ),
        ),
        const Positioned(
          top: 91.84,
          left: 131.73,
          child: SizedBox(
            width: 170.56,
            height: 79.61,
            child: Center(
              child: Text(
                'Islami',
                style: TextStyle(
                  fontFamily: 'Janna LT',
                  fontSize: 60,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFFFD482),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 192,
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
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const SebhaScreen()),
                    );
                  },
                  child: Image.asset(
                    'assets/icons/ic_moon.png',
                    width: 30,
                    height: 30,
                    color: Colors.yellow,
                    errorBuilder: (c, e, s) =>
                    const SizedBox(width: 30, height: 30),
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  'Sura Name',
                  style: TextStyle(
                    fontFamily: 'Janna LT',
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        const Positioned(
          top: 267,
          left: 21,
          child: Text(
            'Most Recently',
            style: TextStyle(
              fontFamily: 'Janna LT',
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: Color(0xFFFEFFE8),
            ),
          ),
        ),
        Positioned(
          top: 300,
          left: 0,
          right: 0,
          child: SizedBox(
            height: 170,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: arabicAuranSuras.length,
              itemBuilder: (context, index) {
                final eng = (index < englishQuranSurahs.length)
                    ? englishQuranSurahs[index]
                    : 'Sura';
                final ar = (index < arabicAuranSuras.length)
                    ? arabicAuranSuras[index]
                    : '';
                final versesStr = (index < AyaNumber.length)
                    ? '${AyaNumber[index]} Verses'
                    : '—';
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: QuranCard(
                    englishName: eng,
                    arabicName: ar,
                    verses: versesStr,
                    imagePath: 'assets/images/photos.png',
                  ),
                );
              },
            ),
          ),
        ),
        const Positioned(
          top: 480,
          left: 21,
          child: Text(
            'Suras List',
            style: TextStyle(
              fontFamily: 'Janna LT',
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          top: 520,
          left: 20,
          right: 20,
          bottom: 90,
          child: ListView.builder(
            itemCount: arabicAuranSuras.length,
            itemBuilder: (context, index) {
              final eng = (index < englishQuranSurahs.length)
                  ? englishQuranSurahs[index]
                  : 'Sura';
              final ar = (index < arabicAuranSuras.length)
                  ? arabicAuranSuras[index]
                  : '';
              final versesStr = (index < AyaNumber.length)
                  ? '${AyaNumber[index]} Verses'
                  : '—';
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: StarSurahCard(
                  index: index,
                  englishName: eng,
                  arabicName: ar,
                  verses: versesStr,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SurahDetailScreen(
                          surahNumber: index + 1,
                          surahEnglishName: eng,
                          surahArabicName: ar,
                          verses: versesStr,
                          backgroundImage:
                          'assets/images/image_one_home.jpg',
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}