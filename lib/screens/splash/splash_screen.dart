import 'package:flutter/material.dart';
import '../onboarding/intro_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const IntroScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 430,
          height: 932,
          color: Colors.black,
          child: Stack(
            children: [
              Positioned(
                top: 384,
                left: 123,
                width: 185,
                height: 165,
                child: Image.asset(
                  'assets/images/objects.png',
                  fit: BoxFit.contain,
                ),
              ),

              Positioned(
                top: 792,
                left: 125,
                width: 180,
                height: 76,
                child: Image.asset(
                  'assets/images/image_route.png',
                  fit: BoxFit.fill,
                ),
              ),

              Positioned(
                top: 862,
                left: 93,
                child: const Text(
                  'Supervised by Mohamed Nabil',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFDAB98D),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.visible,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}