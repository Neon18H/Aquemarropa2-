import 'dart:async';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Timer _timer;
  final int _totalTimeInSeconds =
      3600; // Tiempo total en segundos (por ejemplo: 1 hora = 3600 segundos)
  int _remainingTimeInSeconds = 3600; // Tiempo restante en segundos

  // Método para iniciar el temporizador
  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTimeInSeconds > 0) {
          _remainingTimeInSeconds--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  // Método para detener el temporizador
  void _stopTimer() {
    _timer.cancel();
  }

  // Método para reiniciar el temporizador
  void _resetTimer() {
    setState(() {
      _remainingTimeInSeconds = _totalTimeInSeconds;
    });
  }

  // Método para convertir segundos a un formato de tiempo legible (días, horas, minutos, segundos)
  String _formatTime(int timeInSeconds) {
    int days = timeInSeconds ~/ (24 * 3600);
    timeInSeconds = timeInSeconds % (24 * 3600);
    int hours = timeInSeconds ~/ 3600;
    timeInSeconds %= 3600;
    int minutes = timeInSeconds ~/ 60;
    return '$days días $hours horas $minutes minutos';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 4, 20, 9), // Fondo gris
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Center(
                  child: Image.asset(
                    'assets/Logo-Aquemarropa.png', // Ruta de la imagen local // Ajuste de la imagen
                    width: 300,
                    height: 300,
                  ),
                ),
              ),
            ],
            ),
          const Padding(
            padding: EdgeInsets.only(left: 20), // Ajuste de espaciado lateral

            child: Text(
              'Una pascua muy'

                'egg-special',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.pink),
            ),
          ),
          const SizedBox(height: 100), // Espacio entre el título y las cajas
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                color: Colors.white,
                child: Center(
                  child: Image.asset(
                    'assets/Conejomorado.png', // Ruta de la imagen local
                    width: 200,
                    height: 200,
                    fit: BoxFit.contain, // Ajuste de la imagen
                  ),
                ),
              ),
              const SizedBox(width: 20), // Espacio entre las dos cajas
              Container(
                width: 200,
                height: 200,
                color: Colors.white,
                child: const Center(
                  child: Text(
                    '"Comer"'
                    'Empanadas"', // Texto en una caja
                    style: TextStyle(fontSize: 16, color: Colors.purple),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
              height: 20), // Espacio entre las cajas y el temporizador
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 66, 7, 177),
                borderRadius: BorderRadius.circular(20), // Bordes circulares
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Tiempo restante:',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  Text(
                    _formatTime(
                        _remainingTimeInSeconds), // Mostrar el tiempo restante
                    style: const TextStyle(fontSize: 18, color: Colors.white),
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
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: HomeScreen(),
  ));
}
