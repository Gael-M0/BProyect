import 'package:flutter/material.dart';
import 'Addlocation.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    String name = _nameController.text;
    String password = _passwordController.text;

    if (name.isNotEmpty && password.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AddLocationScreen()),
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
      appBar: AppBar(title: const Text("Login")),
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