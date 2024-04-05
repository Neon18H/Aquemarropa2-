import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/pages/Registrar.dart';
import 'package:flutter_application_1/src/pages/home_screen.dart';
import 'package:flutter_application_1/src/pages/splash_screen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MenuLayout(),
      debugShowCheckedModeBanner: false,
      initialRoute: "splash",
      routes: {
        "splash": (context) => const SplashScreen(),
      },
    );
  }
}

class MenuLayout extends StatefulWidget {
  const MenuLayout({Key? key}) : super(key: key);

  @override
  _MenuLayoutState createState() => _MenuLayoutState();
}

class _MenuLayoutState extends State<MenuLayout> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildOffstageNavigator(0, const HomeScreen()),
          _buildOffstageNavigator(2, const HomeScreen()),
          _buildOffstageNavigator(3, Registrar()),
          _buildBottomNavigationBar(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Sube tu diseño :)',
        child: const Icon(
          Icons.face_sharp,
          color: Colors.pink,
        ),
      ),
    );
  }

  void _incrementCounter() {
    // Cambiar el índice a 5 para la pantalla Registrar
    setState(() {
      _currentIndex = 5;
    });
  }

  Widget _buildBottomNavigationBar() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.home_max_rounded),
            title: Text("Home"),
            selectedColor: Colors.pink,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.image_rounded),
            title: Text("Gallery"),
            selectedColor: Colors.pink,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.star_rate_rounded),
            title: Text("Top"),
            selectedColor: Colors.pink,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.people_rounded),
            title: Text("Register"),
            selectedColor: Colors.pink,
          ),
           SalomonBottomBarItem(
            icon: Icon(Icons.circle, color: Colors.white,),
            title: Text(""),
            selectedColor: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _buildOffstageNavigator(int pageIndex, Widget page) {
    return Offstage(
      offstage: _currentIndex != pageIndex,
      child: Navigator(
        onGenerateRoute: (routeSettings) => MaterialPageRoute(
          builder: (context) => page,
        ),
      ),
    );
  }
}
