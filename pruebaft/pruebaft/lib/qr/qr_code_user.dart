import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeUserScreen extends StatelessWidget {
  final String userName; // Recibe el nombre del usuario

  const QRCodeUserScreen({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    // Generar contenido único para el QR basado en el nombre del usuario
    final qrData = "Usuario: $userName - Sesión: ${DateTime.now().toIso8601String()}";

    return Scaffold(
      appBar: AppBar(
        title: const Text('Código QR del Usuario'),
      ),
      body: Center(
        child: QrImageView(
          data: qrData, // Contenido único del QR
          version: QrVersions.auto, // Versión automática
          size: 200.0, // Tamaño del código QR
        ),
      ),
    );
  }
}