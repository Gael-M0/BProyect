import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:math'; // Importa la clase Random

class QRCodePage extends StatelessWidget {
  const QRCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Generar un número aleatorio como contenido del QR
    final randomData = _generateRandomString(10); // Genera una cadena aleatoria de 10 caracteres

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
}