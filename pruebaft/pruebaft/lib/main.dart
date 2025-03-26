import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'screens/login.dart';
import 'models/task_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializar Hive
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox<Task>('tasks'); // Asegúrate de abrir la caja

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginScreen(), // Cambiado para iniciar en LoginScreen
    );
  }
}