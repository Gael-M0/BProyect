import 'package:flutter/material.dart';
import 'package:pruebaft/qr/loginqr.dart'; // Importa la nueva pantalla de login QR

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginQRScreen(), // Cambiado para iniciar en LoginQRScreen
    );
  }
}