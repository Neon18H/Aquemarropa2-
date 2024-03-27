import 'dart:async';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Timer _timer;
  int _days = 1;
  int _hours = 2;
  int _minutes = 0;

  // Método para iniciar el temporizador
  void _startTimer() {
    _timer = Timer.periodic(Duration(minutes: 1), (timer) {
      setState(() {
        _minutes++;
        if (_minutes == 60) {
          _minutes = 0;
          _hours++;
          if (_hours == 24) {
            _hours = 0;
            _days++;
          }
        }
      });
    });
  }

  // Método para detener el temporizador
  void _stopTimer() {
    _timer.cancel();
  }

  @override
  void dispose() {
    _stopTimer(); // Detener el temporizador al salir de la pantalla
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 4, 20, 9), // Fondo gris
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Título',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: 20), // Espacio entre el título y las cajas
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                color: Colors.white,
                child: Center(
                  child: Image.asset(
                    'Conejomorado.png', // URL de ejemplo
                    width: 200,
                    height: 200,
                    fit: BoxFit.contain, // Ajuste de la imagen
                  ),
                ),
              ),
              SizedBox(width: 20), // Espacio entre las dos cajas
              Container(
                width: 200,
                height: 200,
                color: Colors.white,
                child: Center(
                  child: Text(
                    'Comer Empanadas', // Texto en una caja
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20), // Espacio entre las cajas y el temporizador
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(8.0),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    '$_days días $_hours horas $_minutes minutos',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _startTimer(); // Iniciar el temporizador al presionar el botón flotante
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}
