import 'dart:typed_data';
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/pages/uploaded_file.dart';
// Asegúrate de importar la pantalla UploadedFileScreen

class FileUploadScreen extends StatefulWidget {
  @override
  _FileUploadScreenState createState() => _FileUploadScreenState();
}

class _FileUploadScreenState extends State<FileUploadScreen> {
  List<Uint8List> _selectedImageBytesList = [];

  Future<void> _pickFiles() async {
    html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
    uploadInput.multiple = true;
    uploadInput.click();

    uploadInput.onChange.listen((e) {
      final files = uploadInput.files;
      if (files != null && files.isNotEmpty) {
        for (var file in files) {
          final reader = html.FileReader();
          reader.onLoadEnd.listen((e) {
            setState(() {
              _selectedImageBytesList.add(reader.result as Uint8List);
            });
          });
          reader.readAsArrayBuffer(file);
        }
      }
    });
  }

  // Método para navegar a UploadedFileScreen y pasar los bytes de la imagen
  void _navigateToUploadedFileScreen(Uint8List imageBytes) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UploadedFileScreen(
          imageBytes: imageBytes,
          file: null,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cargar Archivos'),
      ),
      body: Container(
        color: Colors.purple,
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: _pickFiles,
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.cloud_upload,
                        size: 50.0,
                        color: Colors.blue,
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Cargar archivos',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Expanded(
                child: ListView.builder(
                  itemCount: _selectedImageBytesList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        _navigateToUploadedFileScreen(
                            _selectedImageBytesList[index]);
                      },
                      child: Image.memory(
                        _selectedImageBytesList[index],
                        width: 200.0,
                        height: 200.0,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: FileUploadScreen(),
  ));
}
