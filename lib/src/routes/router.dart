import 'package:auto_route/auto_route.dart';
import 'package:ble_app/src/models/db/device_model.dart';
import 'package:ble_app/src/provider/taskall_model_provider.dart';
import 'package:ble_app/src/screens/devices_screen/devices_screen.dart';
import 'package:ble_app/src/screens/devices_task_screen/devices_task_screen.dart';
import 'package:ble_app/src/screens/home_screen.dart';
import 'package:ble_app/src/screens/logs_screen/logs_screen.dart';
import 'package:ble_app/src/screens/sensors_screen/sensors_screen.dart';

import 'package:ble_app/src/screens/welcome_screen.dart';
import 'package:ble_app/src/widgets/information/information_screen.dart';

// class SolenoidRoute extends PageRouteInfo {
//   const SolenoidRoute() : super(name, path: '/solenoid');
//   static const String name = 'SolenoidRoute';
// }

// class SolenoidTaskRoute extends PageRouteInfo {
//   const SolenoidTaskRoute() : super(name, path: '/solenoidtask');
//   static const String name = 'SolenoidTaskRoute';
// }

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute> [
    AutoRoute(page: WelcomeScreen, initial: true), //! set initial route to first page
    AutoRoute(
      path: '/home/',
      page: HomeScreen,
      children: [
        AutoRoute(
          path: 'device',
          name: 'DeviceListRouter',
          page: DevicesScreen,
        ),
        AutoRoute(
          path: 'sensor',
          name: 'SensorListRouter',
          page: SensorsScreen
        ),
        AutoRoute(
          path: 'log',
          name: 'LogListRouter',
          page: LogsScreen,
        ),

      ],
    ),
    AutoRoute(path: '/DevicesList', page: DevicesScreen),
    AutoRoute(page: DevicesTaskScreen),
    AutoRoute(path: '/Information', page: InformationScreen),

    // CustomRoute(
    //   page: AddUpdateTaskScreen,
    //   transitionsBuilder: TransitionsBuilders.slideLeftWithFade
    // ),

  ],
)
class $AppRouter {}