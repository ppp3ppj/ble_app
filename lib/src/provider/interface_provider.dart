import 'package:flutter/foundation.dart';

class InterfaceProvider extends ChangeNotifier {
  //! Day select
  bool _monday = false;
  bool _tuesday = false;
  bool _wednesday = false;
  bool _thursday = false;
  bool _friday = false;
  bool _saturday = false;
  bool _sunday = false;


  List<bool> get days =>
      [_sunday, _monday, _tuesday, _wednesday, _thursday, _friday, _saturday];

  Future<void> setSunday(bool value) async {
    _sunday = value;
    notifyListeners();
  }

  Future<void> setMonday(bool value) async {
    _monday = value;
    notifyListeners();
  }

  Future<void> setTuesday(bool value) async {
    _tuesday = value;
    notifyListeners();
  }

  Future<void> setWednesday(bool value) async {
    _wednesday = value;
    notifyListeners();
  }

  Future<void> setThursday(bool value) async {
    _thursday = value;
    notifyListeners();
  }

  Future<void> setFriday(bool value) async {
    _friday = value;
    notifyListeners();
  }

  Future<void> setSaturday(bool value) async {
    _saturday = value;
    notifyListeners();
  }
}
