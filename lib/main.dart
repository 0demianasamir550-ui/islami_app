import 'package:flutter/material.dart';
import 'screens/splash/splash_screen.dart';

void main() {
  runApp(const IslamiApp());
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Islami App',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: const Color(0xFF3A5A40),
      ),
      home: const SplashScreen(),
    );
  }
}