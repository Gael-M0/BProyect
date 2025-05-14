import 'package:hive/hive.dart';

part 'attendance_model.g.dart';

@HiveType(typeId: 1)
class Attendance {
  @HiveField(0)
  final String userName;

  @HiveField(1)
  final DateTime timestamp;

  Attendance({required this.userName, required this.timestamp});
}