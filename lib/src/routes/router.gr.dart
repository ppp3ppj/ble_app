// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../models/db/device_model.dart' as _i7;
import '../models/db/device_task_model.dart' as _i8;
import '../screens/devices_screen/devices_screen.dart' as _i2;
import '../screens/devices_task_screen/add_update_task_screen.dart' as _i4;
import '../screens/devices_task_screen/devices_task_screen.dart' as _i3;
import '../screens/welcome_screen.dart' as _i1;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    WelcomeScreen.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.WelcomeScreen());
    },
    DevicesScreen.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.DevicesScreen());
    },
    DevicesTaskScreen.name: (routeData) {
      final args = routeData.argsAs<DevicesTaskScreenArgs>();
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.DevicesTaskScreen(
              key: args.key, solenoidDevice: args.solenoidDevice));
    },
    AddUpdateTaskScreen.name: (routeData) {
      final args = routeData.argsAs<AddUpdateTaskScreenArgs>();
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.AddUpdateTaskScreen(
              key: args.key,
              action: args.action,
              solenoidDevice: args.solenoidDevice,
              solenoidTaskDevice: args.solenoidTaskDevice));
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(WelcomeScreen.name, path: '/'),
        _i5.RouteConfig(DevicesScreen.name, path: '/DevicesList'),
        _i5.RouteConfig(DevicesTaskScreen.name, path: '/devices-task-screen'),
        _i5.RouteConfig(AddUpdateTaskScreen.name,
            path: '/add-update-task-screen')
      ];
}

/// generated route for
/// [_i1.WelcomeScreen]
class WelcomeScreen extends _i5.PageRouteInfo<void> {
  const WelcomeScreen() : super(WelcomeScreen.name, path: '/');

  static const String name = 'WelcomeScreen';
}

/// generated route for
/// [_i2.DevicesScreen]
class DevicesScreen extends _i5.PageRouteInfo<void> {
  const DevicesScreen() : super(DevicesScreen.name, path: '/DevicesList');

  static const String name = 'DevicesScreen';
}

/// generated route for
/// [_i3.DevicesTaskScreen]
class DevicesTaskScreen extends _i5.PageRouteInfo<DevicesTaskScreenArgs> {
  DevicesTaskScreen({_i6.Key? key, required _i7.DeviceModel solenoidDevice})
      : super(DevicesTaskScreen.name,
            path: '/devices-task-screen',
            args: DevicesTaskScreenArgs(
                key: key, solenoidDevice: solenoidDevice));

  static const String name = 'DevicesTaskScreen';
}

class DevicesTaskScreenArgs {
  const DevicesTaskScreenArgs({this.key, required this.solenoidDevice});

  final _i6.Key? key;

  final _i7.DeviceModel solenoidDevice;

  @override
  String toString() {
    return 'DevicesTaskScreenArgs{key: $key, solenoidDevice: $solenoidDevice}';
  }
}

/// generated route for
/// [_i4.AddUpdateTaskScreen]
class AddUpdateTaskScreen extends _i5.PageRouteInfo<AddUpdateTaskScreenArgs> {
  AddUpdateTaskScreen(
      {_i6.Key? key,
      required String action,
      required _i7.DeviceModel solenoidDevice,
      required _i8.DeviceTaskModel? solenoidTaskDevice})
      : super(AddUpdateTaskScreen.name,
            path: '/add-update-task-screen',
            args: AddUpdateTaskScreenArgs(
                key: key,
                action: action,
                solenoidDevice: solenoidDevice,
                solenoidTaskDevice: solenoidTaskDevice));

  static const String name = 'AddUpdateTaskScreen';
}

class AddUpdateTaskScreenArgs {
  const AddUpdateTaskScreenArgs(
      {this.key,
      required this.action,
      required this.solenoidDevice,
      required this.solenoidTaskDevice});

  final _i6.Key? key;

  final String action;

  final _i7.DeviceModel solenoidDevice;

  final _i8.DeviceTaskModel? solenoidTaskDevice;

  @override
  String toString() {
    return 'AddUpdateTaskScreenArgs{key: $key, action: $action, solenoidDevice: $solenoidDevice, solenoidTaskDevice: $solenoidTaskDevice}';
  }
}
