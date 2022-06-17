import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'device_model.g.dart';

@HiveType(typeId: 1)
class DeviceModel {

  @HiveField(0)
  int? id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  DateTime? date;

  @HiveField(3)
  bool status;

  @HiveField(4)
  bool statusTask; //? for taskStatus
  

  DeviceModel({
    this.id, this.date, required this.title, this.status = false, this.statusTask = false,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'date': date,
    'status': status,
    'statusTask' :statusTask,
  };

  
  // List<SolenoidModel> get solenoidV => solenoid;
}