import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class Task {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final double? latitude;

  @HiveField(2)
  final double? longitude;

  Task({required this.title, this.latitude, this.longitude});
}