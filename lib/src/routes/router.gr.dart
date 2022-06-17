// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../models/db/device_model.dart' as _i6;
import '../screens/devices_screen/devices_screen.dart' as _i2;
import '../screens/devices_task_screen/devices_task_screen.dart' as _i3;
import '../screens/welcome_screen.dart' as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    WelcomeScreen.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.WelcomeScreen());
    },
    DevicesScreen.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.DevicesScreen());
    },
    DevicesTaskScreen.name: (routeData) {
      final args = routeData.argsAs<DevicesTaskScreenArgs>();
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.DevicesTaskScreen(
              key: args.key, solenoidDevice: args.solenoidDevice));
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(WelcomeScreen.name, path: '/'),
        _i4.RouteConfig(DevicesScreen.name, path: '/DevicesList'),
        _i4.RouteConfig(DevicesTaskScreen.name, path: '/devices-task-screen')
      ];
}

/// generated route for
/// [_i1.WelcomeScreen]
class WelcomeScreen extends _i4.PageRouteInfo<void> {
  const WelcomeScreen() : super(WelcomeScreen.name, path: '/');

  static const String name = 'WelcomeScreen';
}

/// generated route for
/// [_i2.DevicesScreen]
class DevicesScreen extends _i4.PageRouteInfo<void> {
  const DevicesScreen() : super(DevicesScreen.name, path: '/DevicesList');

  static const String name = 'DevicesScreen';
}

/// generated route for
/// [_i3.DevicesTaskScreen]
class DevicesTaskScreen extends _i4.PageRouteInfo<DevicesTaskScreenArgs> {
  DevicesTaskScreen({_i5.Key? key, required _i6.DeviceModel solenoidDevice})
      : super(DevicesTaskScreen.name,
            path: '/devices-task-screen',
            args: DevicesTaskScreenArgs(
                key: key, solenoidDevice: solenoidDevice));

  static const String name = 'DevicesTaskScreen';
}

class DevicesTaskScreenArgs {
  const DevicesTaskScreenArgs({this.key, required this.solenoidDevice});

  final _i5.Key? key;

  final _i6.DeviceModel solenoidDevice;

  @override
  String toString() {
    return 'DevicesTaskScreenArgs{key: $key, solenoidDevice: $solenoidDevice}';
  }
}
