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

  //* Auto mode
  //TODO: set auto 0 at this to condition to disable auto mode every use 
  //? can't not be set null to this value 
  @HiveField(5)
  int autoMinOn;
  @HiveField(6)
  int autoMaxOff;
  

  DeviceModel({
    this.id, this.date, required this.title, this.status = false, this.statusTask = false, this.autoMaxOff = 0, this.autoMinOn = 0, 
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'date': date,
    'status': status,
    'statusTask' :statusTask,
    'autoMode' : '$autoMinOn : $autoMaxOff'
  };

  
  // List<SolenoidModel> get solenoidV => solenoid;
}