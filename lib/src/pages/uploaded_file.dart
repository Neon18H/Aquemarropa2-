import 'dart:typed_data';
import 'package:flutter/material.dart';

class UploadedFileScreen extends StatelessWidget {
  final Uint8List imageBytes;

  UploadedFileScreen({required this.imageBytes, required file});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Archivo Subido'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Archivo Subido:',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 10.0),
            Image.memory(
              imageBytes,
              width: 200.0,
              height: 200.0,
            ),
          ],
        ),
      ),
    );
  }
}
