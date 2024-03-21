import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/pages/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var d = const Duration(seconds: 4);
    Future.delayed(d, () {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return HomeScreen();
      }), (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/carga.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: const Align(
                alignment: Alignment.bottomCenter,
                child: ListTile(
                  title: Text(
                    "WELCOME TO AQUEMARROPA",
                    textAlign: TextAlign.center,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
