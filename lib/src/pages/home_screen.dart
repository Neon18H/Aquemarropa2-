import 'package:flutter/material.dart';
import 'package:flutter_application_1/modelos/categorias.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Container(
          child: GridView.builder(
            itemCount: Cajas.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
            itemBuilder: (context,index){
              return Container(
                margin: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/"+Cajas[index].foot, 
                          width: 150, // Tamaño de la imagen ajustado
                        ),
                        Text(Cajas[index].name),
                      ],
                    ),
                    SizedBox(width: 10), // Espacio entre la imagen y la caja
                    Container(
                      width: 100, // Ancho de la caja ajustado
                      height: 100, // Alto de la caja ajustado
                      color: Colors.white, // Color de fondo de la caja
                      child: Center(
                        child: Text(
                          'Texto en la caja',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
