import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HadithScreen(),
  ));
}

class HadithScreen extends StatefulWidget {
  const HadithScreen({super.key});

  @override
  State<HadithScreen> createState() => _HadithScreenState();
}

class _HadithScreenState extends State<HadithScreen> {
  late PageController _pageController;
  final Map<int, String> _hadithCache = {};

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1000, viewportFraction: 0.8);
  }

  Future<String> _loadHadith(int number) async {
    if (_hadithCache.containsKey(number)) {
      return _hadithCache[number]!;
    }

    final path = 'assets/Hadeeth/h$number.txt';
    final content = await rootBundle.loadString(path);
    _hadithCache[number] = content;
    return content;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/one.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black54,
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 60),

              Column(
                children: [
                  Image.asset(
                    "assets/images/mosque.png",
                    width: 120,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Islami",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemBuilder: (context, index) {
                    final hadithNumber = (index % 50) + 1;

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: FutureBuilder<String>(
                        future: _loadHadith(hadithNumber),
                        builder: (context, snapshot) {
                          final hadithText = snapshot.data ?? "جارٍ التحميل...";
                          return Stack(
                            children: [
                              Container(
                                width: 313,
                                height: 650,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFE2BE7F),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 100,
                                      left: 24,
                                      child: Opacity(
                                        opacity: 0.25,
                                        child: Image.asset(
                                          "assets/images/background_card.png",
                                          width: 265,
                                          height: 411.27,
                                        ),
                                      ),
                                    ),

                                    Positioned(
                                      top: 20,
                                      left: 0,
                                      right: 0,
                                      child: Center(
                                        child: Text(
                                          "الحديث $hadithNumber",
                                          style: const TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),

                                    Positioned(
                                      top: 60,
                                      left: 20,
                                      right: 20,
                                      bottom: 100,
                                      child: SingleChildScrollView(
                                        child: Text(
                                          hadithText,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.black87,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),

                                    Positioned(
                                      top: 10,
                                      right: 10,
                                      child: Image.asset(
                                        "assets/images/design_card.png",
                                        width: 93,
                                        height: 100.63,
                                      ),
                                    ),
                                    Positioned(
                                      top: 10,
                                      left: 10,
                                      child: Transform(
                                        alignment: Alignment.center,
                                        transform: Matrix4.rotationY(3.1416),
                                        child: Image.asset(
                                          "assets/images/design_card.png",
                                          width: 93,
                                          height: 100.63,
                                        ),
                                      ),
                                    ),

                                    Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(24),
                                        child: Image.asset(
                                          "assets/images/mosque_card.png",
                                          width: 312,
                                          height: 88.6,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}