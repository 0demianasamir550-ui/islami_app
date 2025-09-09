import 'package:flutter/material.dart';

class RadioScreen extends StatefulWidget {
  const RadioScreen({super.key});

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  bool isRadioSelected = true;

  @override
  Widget build(BuildContext context) {
    List<String> radioNames = [
      'Radio Ibrahim Al-Akdar',
      'Radio Al-Qaria Yassen',
      'Radio Ahmed Al-Trabulsi',
      'Radio Abdokail Mohamed Alalim',
    ];

    List<String> recitersNames = [
      'Ibrahim Al-Akdar',
      'Akram Alalaqmi',
      'Majed Al-Enezi',
      'Malik Shaibat Alhamed',
    ];

    List<String> displayedNames =
    isRadioSelected ? radioNames : recitersNames;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/three.jpg',
              fit: BoxFit.cover,
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
            top: 150,
            left: 20,
            child: Container(
              width: 390,
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xB3202020),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isRadioSelected = true;
                      });
                    },
                    child: Container(
                      width: 195,
                      height: 50,
                      decoration: BoxDecoration(
                        color: isRadioSelected
                            ? const Color(0xFFE2BE7F)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          'Radio',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isRadioSelected = false;
                      });
                    },
                    child: Container(
                      width: 195,
                      height: 50,
                      decoration: BoxDecoration(
                        color: !isRadioSelected
                            ? const Color(0xFFE2BE7F)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          'Reciters',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            top: 220,
            left: 20,
            right: 20,
            bottom: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(4, (index) {
                return Container(
                  height: 140,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFFE2BE7F),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/mosque.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        top: 20,
                        child: Text(
                          displayedNames[index],
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 15,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (index == 1)
                              Row(
                                children: const [
                                  Icon(
                                    Icons.pause,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                  SizedBox(width: 20),
                                  Icon(
                                    Icons.volume_off,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                ],
                              )
                            else
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Image.asset(
                                      'assets/icons/ic_video.png',
                                      width: 30,
                                      height: 30,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.volume_up,
                                      color: Colors.black,
                                      size: 30,
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(home: RadioScreen()));
}