import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'sensor_model.g.dart';
@HiveType(typeId: 3)
//TODO: add string : uuid for ble when write sensor screen interface is done.
class SensorModel {
  @HiveField(0)
  int? id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  double value;
  // String dateUpdate;
  // final String uuid; 
  SensorModel({this.id, required this.name, this.value = 0.0});

  Map<String, dynamic> toJson() =>  {
    'id': id,
    'name': name,
    'value': value,
  };
}


