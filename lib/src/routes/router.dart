import 'package:auto_route/auto_route.dart';
import 'package:ble_app/src/models/db/device_model.dart';
import 'package:ble_app/src/provider/taskall_model_provider.dart';
import 'package:ble_app/src/screens/devices_screen/devices_screen.dart';
import 'package:ble_app/src/screens/devices_task_screen/add_update_task_screen.dart';
import 'package:ble_app/src/screens/devices_task_screen/devices_task_screen.dart';

import 'package:ble_app/src/screens/welcome_screen.dart';

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
    AutoRoute(page: WelcomeScreen, initial: true),
    AutoRoute(path: '/DevicesList', page: DevicesScreen),
    // AutoRoute(path: '/solenoid/task', page: Sole1),
    AutoRoute(page: DevicesTaskScreen),
    AutoRoute(page: AddUpdateTaskScreen), //!now not use
    // CustomRoute(
    //   page: AddUpdateTaskScreen,
    //   transitionsBuilder: TransitionsBuilders.slideLeftWithFade
    // ),
    // AutoRoute(Solenoid)

  ],
)
class $AppRouter {}