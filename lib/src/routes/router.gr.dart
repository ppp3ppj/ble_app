// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;

import '../models/db/device_model.dart' as _i12;
import '../screens/ble_screen/devices_list_screen/ble_device_list.dart' as _i6;
import '../screens/devices_screen/devices_screen.dart' as _i3;
import '../screens/devices_task_screen/devices_task_screen.dart' as _i4;
import '../screens/home_screen.dart' as _i2;
import '../screens/logs_screen/ble_log/ble_device_log_screen.dart' as _i7;
import '../screens/logs_screen/logs_screen.dart' as _i9;
import '../screens/sensors_screen/sensors_screen.dart' as _i8;
import '../screens/welcome_screen.dart' as _i1;
import '../widgets/information/information_screen.dart' as _i5;

class AppRouter extends _i10.RootStackRouter {
  AppRouter([_i11.GlobalKey<_i11.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    WelcomeScreen.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.WelcomeScreen());
    },
    HomeScreen.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.HomeScreen());
    },
    DevicesScreen.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.DevicesScreen());
    },
    DevicesTaskScreen.name: (routeData) {
      final args = routeData.argsAs<DevicesTaskScreenArgs>();
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.DevicesTaskScreen(
              key: args.key, solenoidDevice: args.solenoidDevice));
    },
    InformationScreen.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.InformationScreen());
    },
    BleDeviceListScreen.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.BleDeviceListScreen());
    },
    BleDeviceLogScreen.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.BleDeviceLogScreen());
    },
    DeviceListRouter.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.DevicesScreen());
    },
    SensorListRouter.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.SensorsScreen());
    },
    LogListRouter.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.LogsScreen());
    }
  };

  @override
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig(WelcomeScreen.name, path: '/'),
        _i10.RouteConfig(HomeScreen.name, path: '/home/', children: [
          _i10.RouteConfig(DeviceListRouter.name,
              path: 'device', parent: HomeScreen.name),
          _i10.RouteConfig(SensorListRouter.name,
              path: 'sensor', parent: HomeScreen.name),
          _i10.RouteConfig(LogListRouter.name,
              path: 'log', parent: HomeScreen.name)
        ]),
        _i10.RouteConfig(DevicesScreen.name, path: '/DevicesList'),
        _i10.RouteConfig(DevicesTaskScreen.name, path: '/devices-task-screen'),
        _i10.RouteConfig(InformationScreen.name, path: '/Information'),
        _i10.RouteConfig(BleDeviceListScreen.name, path: '/BleDeviceList'),
        _i10.RouteConfig(BleDeviceLogScreen.name, path: '/BleShowLog')
      ];
}

/// generated route for
/// [_i1.WelcomeScreen]
class WelcomeScreen extends _i10.PageRouteInfo<void> {
  const WelcomeScreen() : super(WelcomeScreen.name, path: '/');

  static const String name = 'WelcomeScreen';
}

/// generated route for
/// [_i2.HomeScreen]
class HomeScreen extends _i10.PageRouteInfo<void> {
  const HomeScreen({List<_i10.PageRouteInfo>? children})
      : super(HomeScreen.name, path: '/home/', initialChildren: children);

  static const String name = 'HomeScreen';
}

/// generated route for
/// [_i3.DevicesScreen]
class DevicesScreen extends _i10.PageRouteInfo<void> {
  const DevicesScreen() : super(DevicesScreen.name, path: '/DevicesList');

  static const String name = 'DevicesScreen';
}

/// generated route for
/// [_i4.DevicesTaskScreen]
class DevicesTaskScreen extends _i10.PageRouteInfo<DevicesTaskScreenArgs> {
  DevicesTaskScreen({_i11.Key? key, required _i12.DeviceModel solenoidDevice})
      : super(DevicesTaskScreen.name,
            path: '/devices-task-screen',
            args: DevicesTaskScreenArgs(
                key: key, solenoidDevice: solenoidDevice));

  static const String name = 'DevicesTaskScreen';
}

class DevicesTaskScreenArgs {
  const DevicesTaskScreenArgs({this.key, required this.solenoidDevice});

  final _i11.Key? key;

  final _i12.DeviceModel solenoidDevice;

  @override
  String toString() {
    return 'DevicesTaskScreenArgs{key: $key, solenoidDevice: $solenoidDevice}';
  }
}

/// generated route for
/// [_i5.InformationScreen]
class InformationScreen extends _i10.PageRouteInfo<void> {
  const InformationScreen()
      : super(InformationScreen.name, path: '/Information');

  static const String name = 'InformationScreen';
}

/// generated route for
/// [_i6.BleDeviceListScreen]
class BleDeviceListScreen extends _i10.PageRouteInfo<void> {
  const BleDeviceListScreen()
      : super(BleDeviceListScreen.name, path: '/BleDeviceList');

  static const String name = 'BleDeviceListScreen';
}

/// generated route for
/// [_i7.BleDeviceLogScreen]
class BleDeviceLogScreen extends _i10.PageRouteInfo<void> {
  const BleDeviceLogScreen()
      : super(BleDeviceLogScreen.name, path: '/BleShowLog');

  static const String name = 'BleDeviceLogScreen';
}

/// generated route for
/// [_i3.DevicesScreen]
class DeviceListRouter extends _i10.PageRouteInfo<void> {
  const DeviceListRouter() : super(DeviceListRouter.name, path: 'device');

  static const String name = 'DeviceListRouter';
}

/// generated route for
/// [_i8.SensorsScreen]
class SensorListRouter extends _i10.PageRouteInfo<void> {
  const SensorListRouter() : super(SensorListRouter.name, path: 'sensor');

  static const String name = 'SensorListRouter';
}

/// generated route for
/// [_i9.LogsScreen]
class LogListRouter extends _i10.PageRouteInfo<void> {
  const LogListRouter() : super(LogListRouter.name, path: 'log');

  static const String name = 'LogListRouter';
}
