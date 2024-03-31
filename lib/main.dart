import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/pages/home_screen.dart';
import 'package:flutter_application_1/src/pages/splash_screen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
      initialRoute: "splash",
      routes: {
        "splash": (context) => const SplashScreen(),
      }
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;


  void _incrementCounter() {
    setState(() {
    
  
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
    
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
 
        title: Text(widget.title),
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex ,
        margin: EdgeInsets.symmetric(vertical:30, horizontal:20),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

        },
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.home_max_rounded), 
            title: Text("home"),
            selectedColor: Colors.pink,
            ),
          SalomonBottomBarItem(
            icon: Icon(Icons.image_rounded), 
            title: Text("galeria"),
            selectedColor: Colors.pink,
            ),
          SalomonBottomBarItem(
            icon: Icon(Icons.star_rate_rounded), 
            title: Text("rop"),
            selectedColor: Colors.pink,
            ),
          SalomonBottomBarItem(
            icon: Icon(Icons.people_rounded), 
            title: Text("perfil"),
            selectedColor: Colors.pink,
            ),
        ],),

      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
       
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


