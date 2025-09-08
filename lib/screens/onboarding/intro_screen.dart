import 'package:flutter/material.dart';
import '../../styles/app_text_styles.dart';
import '../home_screen/home_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> pages = [
    {
      'image': 'assets/images/image_one.png',
      'title': 'Welcome To Islami App',
      'subtitle': '',
    },
    {
      'image': 'assets/images/image_two.png',
      'title': 'Welcome To Islami',
      'subtitle': 'We Are Very Excited To Have You In Our Community',
    },
    {
      'image': 'assets/images/image_three.png',
      'title': 'Reading the Quran.',
      'subtitle': 'Read,and your lord is the Most Generous',
    },
    {
      'image': 'assets/images/image_four.png',
      'title': 'Bearish.',
      'subtitle': 'Praise the name of your lord,the Most High',
    },
    {
      'image': 'assets/images/image_five.png',
      'title': 'Holy Quran Radio.',
      'subtitle': 'You can listen to the Holy Quran Radio through the application for free and easily',
    },
  ];

  void _nextPage() {
    if (_currentPage < pages.length - 1) {
      _pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut);
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: pages.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              final page = pages[index];

              if (index == 0) {
                return Container(
                  width: size.width,
                  height: size.height,
                  color: const Color(0xFF202020),
                  child: Column(
                    children: [
                      const SizedBox(height: 16),

                      Stack(
                        children: [
                          Image.asset(
                            'assets/images/mosque.png',
                            width: 291,
                            height: 151,
                            fit: BoxFit.contain,
                          ),
                          Positioned(
                            bottom: 10,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Text(
                                'Islami',
                                style: const TextStyle(
                                  fontFamily: 'Janna LT',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 80,
                                  height: 1.0,
                                  color: Color(0xFFFFD482),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),

                      Image.asset(
                        page['image']!,
                        height: 300,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 398,
                        height: 45,
                        child: Text(
                          page['title']!,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.introDescription,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                );
              }

              return Container(
                width: size.width,
                height: size.height,
                color: const Color(0xFF202020),
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    Stack(
                      children: [
                        Image.asset(
                          'assets/images/mosque.png',
                          width: 291,
                          height: 151,
                          fit: BoxFit.contain,
                        ),
                        Positioned(
                          bottom: 10,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Text(
                              'Islami',
                              style: const TextStyle(
                                fontFamily: 'Janna LT',
                                fontWeight: FontWeight.w400,
                                fontSize: 80,
                                height: 1.0,
                                color: Color(0xFFFFD482),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Image.asset(
                      page['image']!,
                      height: 300,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 20),
                    Column(
                      children: [
                        Text(
                          page['title']!,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.introDescription.copyWith(
                            fontWeight: page['subtitle'] != ''
                                ? FontWeight.w700
                                : FontWeight.w400,
                            fontSize: page['subtitle'] != '' ? 24 : 16,
                          ),
                        ),
                        if (page['subtitle'] != '')
                          const SizedBox(height: 16),
                        if (page['subtitle'] != '')
                          Text(
                            page['subtitle']!,
                            textAlign: TextAlign.center,
                            style: AppTextStyles.introDescription.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
              );
            },
          ),

          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (_currentPage > 0)
                    GestureDetector(
                      onTap: () {
                        _pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut);
                      },
                      child: const Text(
                        'Back',
                        style: TextStyle(
                          color: Color(0xFFE2BE7F),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    )
                  else
                    const SizedBox(width: 50),
                  Row(
                    children: List.generate(pages.length, (index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        width: 7,
                        height: 7,
                        decoration: BoxDecoration(
                          color: _currentPage == index
                              ? const Color(0xFFE2BE7F)
                              : const Color(0xFF707070),
                          shape: BoxShape.circle,
                        ),
                      );
                    }),
                  ),
                  GestureDetector(
                    onTap: _nextPage,
                    child: Text(
                      _currentPage == pages.length - 1 ? 'Finish' : 'Next',
                      style: const TextStyle(
                          color: Color(0xFFE2BE7F),
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
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