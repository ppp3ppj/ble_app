import 'package:ble_app/src/global/global_text.dart';
import 'package:ble_app/src/screens/sensors_screen/sensors_screen.dart';
import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:ble_app/src/routes/router.gr.dart';

import 'package:salomon_bottom_bar/salomon_bottom_bar.dart'; //? bottom nav bar
//! for set bottom nav bar --> auto route
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  String showNameOfRouter(int index) {
    String valueOutput = '';
    switch(index) {
      case 0: {
      valueOutput = 'Solenoid Device'; 
      } break;
      case 1: {
      valueOutput = 'Sensor Device'; 
      } break;
      case 2: {
      valueOutput = 'Data Log'; 
      } break;
      default: {
      valueOutput = 'No Router';
      } break;
    }
    return valueOutput;
  }
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      appBarBuilder: ((_, tabsRouter) => AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12)
          )
        ),
        backgroundColor: Colors.indigo,
        // title: GlobalText(text: '${tabsRouter.currentChild!.name}',),
        // title: GlobalText(text: '${tabsRouter.activeIndex}',),
        title: GlobalText(text: showNameOfRouter(tabsRouter.activeIndex), fontSize: 22, color: Colors.white,),
        centerTitle: true,
        leading: const AutoLeadingButton(),
        //! add action for show information of Bluetooth connected
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.bluetooth))
        ],
      )),
      // backgroundColor: Colors.indigo,
      backgroundColor: Colors.white,
      animationDuration: const Duration(microseconds: 0), //! This  solved my flashing issue
      routes: const [
        //! use name on autoroute
        DeviceListRouter(),
        SensorListRouter(),
        LogListRouter(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return SalomonBottomBar(
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          
          items: [
             SalomonBottomBarItem(
              // selectedColor: Colors.amberAccent,
              selectedColor: Colors.blue,
              icon: const Icon(
                Icons.device_hub,
                size: 30,
              ),
              // title: const Text('Device'),
              title: GlobalText(text: 'Device', fontSize: 14,fontWeight: FontWeight.bold,color: Colors.blue,)
            ),
             SalomonBottomBarItem(
              selectedColor: Colors.blue,
              icon: const Icon(
                Icons.sensors,
                size: 30,
              ),
              title: GlobalText(text: 'Sensor', fontSize: 14,fontWeight: FontWeight.bold,color: Colors.blue,)
              // title: const Text('Sensor'),
            ),
            SalomonBottomBarItem(
              selectedColor: Colors.blue,
              icon: const Icon(
                Icons.receipt_long_outlined,
                size: 30,
              ),
              title: GlobalText(text: 'Data Log', fontSize: 14,fontWeight: FontWeight.bold,color: Colors.blue,)
              // title: const Text('Data Log'),
            ),
            
          ]
        );
      },


    );
  }
}