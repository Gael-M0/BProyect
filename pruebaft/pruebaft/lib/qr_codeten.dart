import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:math'; // Importa la clase Random
import 'dart:async'; // Importa Timer para manejar el temporizador

class QRCodePageten extends StatefulWidget {
  const QRCodePageten ({super.key});

  @override
  State<QRCodePageten> createState() => _QRCodePageState();
}

class _QRCodePageState extends State<QRCodePageten> {
  late String randomData; // Variable para almacenar el contenido del QR
  late Timer timer; // Temporizador para actualizar el QR

  @override
  void initState() {
    super.initState();
    randomData = _generateRandomString(10); // Genera el primer QR
    _startTimer(); // Inicia el temporizador
  }

  @override
  void dispose() {
    timer.cancel(); // Cancela el temporizador al salir de la pantalla
    super.dispose();
  }

  void _startTimer() {
    timer = Timer.periodic(const Duration(seconds: 10), (Timer t) {
      setState(() {
        randomData = _generateRandomString(10); // Genera un nuevo QR cada 10 segundos
      });
    });
  }

  // Método para generar una cadena aleatoria
  String _generateRandomString(int length) {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    final random = Random();
    return String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => chars.codeUnitAt(random.nextInt(chars.length)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code Generator'),
      ),
      body: Center(
        child: QrImageView(
          data: randomData, // Contenido aleatorio del código QR
          version: QrVersions.auto, // Versión automática
          size: 200.0, // Tamaño del código QR
        ),
      ),
    );
  }
}