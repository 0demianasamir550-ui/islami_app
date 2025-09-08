import 'package:flutter/material.dart';
import 'widgets/bottom_icons.dart';
import '../../widgets/quran_card.dart';
import '../../widgets/StarSurahCard.dart';
import '../../data/surah_data.dart';
import '../../Suars/surah_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String currentImage = 'assets/images/image_one_home.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        // الخلفية الأساسية + overlay مظلم
        Container(color: const Color(0xFF202020)),
        Positioned.fill(
          child: Stack(children: [
            Image.asset(
              currentImage,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              errorBuilder: (c, e, s) => Container(color: const Color(0xFF202020)),
            ),
            Container(color: Colors.black.withOpacity(0.4)),
          ]),
        ),

        // صورة المسجد + كلمة Islami
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

        // المستطيل الشفاف العلوي (Sura Name)
        Positioned(
          top: 192,
          left: 20,
          right: 20,
          child: Container(
            height: 55,
            decoration: BoxDecoration(
              color: const Color(0xB3202020), // #202020 مع شفافية
              border: Border.all(color: const Color(0xFFE2BE7F), width: 1),
            ),
            child: Row(
              children: [
                const SizedBox(width: 10),
                Image.asset(
                  'assets/icons/ic_moon.png',
                  width: 30,
                  height: 30,
                  color: Colors.yellow,
                  errorBuilder: (c, e, s) => const SizedBox(width: 30, height: 30),
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

        // Most Recently title
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

        // مستطيلات السور الأفقية (QuranCard) - لون #E2BE7F، النص على الشمال، الصورة على اليمين
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
                final eng = (index < englishQuranSurahs.length) ? englishQuranSurahs[index] : 'Sura';
                final ar = (index < arabicAuranSuras.length) ? arabicAuranSuras[index] : '';
                final versesStr = (index < AyaNumber.length) ? '${AyaNumber[index]} Verses' : '—';
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

        // Suras List title
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

        // قائمة النجوم (عمودية) - كل عنصر نجمة + بيانات + divider
        Positioned(
          top: 520,
          left: 20,
          right: 20,
          bottom: 90, // يترك مساحة للشريط السفلي
          child: ListView.builder(
            itemCount: arabicAuranSuras.length,
            itemBuilder: (context, index) {
              final eng = (index < englishQuranSurahs.length) ? englishQuranSurahs[index] : 'Sura';
              final ar = (index < arabicAuranSuras.length) ? arabicAuranSuras[index] : '';
              final versesStr = (index < AyaNumber.length) ? '${AyaNumber[index]} Verses' : '—';
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: StarSurahCard(
                  index: index,
                  englishName: eng,
                  arabicName: ar,
                  verses: versesStr,
                  onTap: () {
                    // عند الضغط ننتقل لصفحة التفاصيل مع نفس الخلفية وقيمة الاسم
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SurahDetailScreen(
                          surahNumber: index + 1,
                          surahEnglishName: eng,
                          surahArabicName: ar,
                          verses: versesStr,
                          backgroundImage: currentImage,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),

        // الشريط السفلي مع الأيقونات (يغيّر الخلفية عند الضغط)
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
      ]),
    );
  }
}