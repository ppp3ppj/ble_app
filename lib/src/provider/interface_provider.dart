import 'package:flutter/foundation.dart';

class InterfaceProvider extends ChangeNotifier {
  // //! slider select
  // double _currentValueSlider = 0.0;
  // void changeValueSlider(double value) {
  //   _currentValueSlider = value;
  //   notifyListeners();
  // }
  // double get currentValueSlider => _currentValueSlider;

  // //! slider rangeSlider widget
  // double _startValueRangeSlider = 0;
  // double _endValueRangeSlider = 0;
  // void changeValueRangeSlider(double startValue, double endValue) {
  //   _startValueRangeSlider = startValue;
  //   _endValueRangeSlider = endValue;
  //   notifyListeners();
  // }
  // double get startValueRangeSlider => _startValueRangeSlider;
  // double get endValueRangeSlider => _endValueRangeSlider;





  //! Day select
  bool _monday = false;
  bool _tuesday = false;
  bool _wednesday = false;
  bool _thursday = false;
  bool _friday = false;
  bool _saturday = false;
  bool _sunday = false;
  bool _canConfirm = false;

  int? _startHour = 0;
  int? _startMinute = 0;

  int? _endHour = 0;
  int? _endMinute= 0;

  int? durationCheck; //for check duration if - = error reset start stop

  String get startTime => '$_startHour:$_startMinute';

  int _hour = 0;
  int _minute = 0;

  String startDate ='00:00';
  String endDate ='00:00';

  Future<void> setStartDate(String text) async {
    startDate = text;
    notifyListeners();
  }

  Future<void> setEndDate(String text) async {
    endDate = text;
    notifyListeners();
  }
  

  List<int> get times => [_hour, _minute];
  // List<String> get timesString => [_hour.toString().padLeft(2, '0'), _minute.toString().padLeft(2, '0')];
  String get timesString => _hour.toString().padLeft(2, '0') + ':' + _minute.toString().padLeft(2, '0');

  int get hour => _hour;
  int get minute => _minute;

  Future<void> setHour(int hour) async {
    _hour = hour;
    notifyListeners();
  }
  Future<void> setMinute(int minute) async {
    _minute = minute;
    notifyListeners();
  }

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
