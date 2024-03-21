import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/pages/home_screen.dart';
import 'package:flutter_application_1/src/pages/splash_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "splash",
      routes: {
        "splash": (context) => const SplashScreen(),
        "home": (context) => const HomeScreen(),
      }
    );
  }
}
