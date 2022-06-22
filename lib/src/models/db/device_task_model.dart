import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'device_task_model.g.dart';

@HiveType(typeId: 2)
class DeviceTaskModel {

  @HiveField(0)
  int? id;

  @HiveField(1)
  final DateTime date;

  @HiveField(2)
  final String title;

  //! add or remove status 
  @HiveField(3)
  bool status;

  //! time start end
  @HiveField(4)
  String startDate;
  @HiveField(5)
  String endDate;
    //! Day of week V1 test
  // @HiveField(4)
  int? hour;
  int? minute;

  bool? monday;
  // @HiveField(5)
  bool? tuesday;
  // @HiveField(6)
  bool? wednesday;
  // @HiveField(7)
  bool? thursday;
  // @HiveField(8)
  bool? friday;
  // @HiveField(9)
  bool? saturday;
  // @HiveField(10)
  bool? sunday;

  DeviceTaskModel({
    this.id,
    required this.title,
    required this.date,
    this.status = false,
    this.hour = 0,
    this.minute = 0,
    this.startDate = '00:00',
    this.endDate =  '00:00',
        this.sunday = false, this.monday = false, this.tuesday = false, this.wednesday = false, this.thursday = false, this.friday = false, this.saturday = false, 
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'date': date,
    'title': title,
    'dayofweek' : days,
    'time' : times,
    'durationdate' : durationdate,
  };

  List<bool> get days {
    return [sunday!, monday!, thursday!, wednesday!, thursday!, friday!, saturday!];
  }

  List<int?> get times {
    return [hour, minute];
  }
  
  // String get time
  List<String> get durationdate {
    return ['Start time is ${startDate}', 'End time is $endDate'];
  }

}
