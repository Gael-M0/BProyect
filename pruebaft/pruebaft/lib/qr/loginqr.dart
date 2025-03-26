import 'package:flutter/material.dart';
import '../qr/qr_code_user.dart'; // Importa la pantalla del QR

class LoginQRScreen extends StatefulWidget {
  @override
  _LoginQRScreenState createState() => _LoginQRScreenState();
}

class _LoginQRScreenState extends State<LoginQRScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    String name = _nameController.text;
    String password = _passwordController.text;

    if (name.isNotEmpty && password.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => QRCodeUserScreen(userName: name), // Pasa el nombre del usuario
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Por favor, ingresa todos los campos")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login QR")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: "Nombre"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: "Contraseña"),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: const Text("Iniciar Sesión"),
            ),
          ],
        ),
      ),
    );
  }
}