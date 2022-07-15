import 'dart:developer';

import 'package:ble_app/src/global/global_text.dart';
import 'package:ble_app/src/provider/sensor_model_provider.dart';
import 'package:ble_app/src/widgets/sensor/sensor_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:intl/intl.dart';

class SensorsScreen extends StatefulWidget {
  const SensorsScreen({Key? key}) : super(key: key);

  @override
  State<SensorsScreen> createState() => _SensorsScreenState();
}

class _SensorsScreenState extends State<SensorsScreen> {
  DateTime refreshPullDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    //! get data all
    context.watch<SensorModelProvider>().getAllSensor();
  String formattedDate = DateFormat('yyyy-MM-dd - kk:mm').format(refreshPullDate);
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height) / 2;
    final double itemWidth = size.width / 2;
    // final double itemHeight = size.height;
    // final double itemWidth = size.width;
    // log('$itemHeight : $itemWidth');
    return Consumer<SensorModelProvider>(builder: (context, sensor, child) {
      return Scaffold(
        body: RefreshIndicator(
          onRefresh: _pullRefresh,
          child: Container(
            padding: EdgeInsets.all(5.0),
            child: Column(
              // crossAxisAlignment: ,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GlobalText(
                      text: 'อัพเดตเมื่อ ${formattedDate}',
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                    Icon(
                      Icons.refresh_rounded,
                      color: Colors.grey,
                    )
                  ],
                ),
                Expanded(
                  child: 
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      // childAspectRatio: 2 / 2,
                      childAspectRatio: (itemWidth * 7 / itemHeight * 0.215),
                      // childAspectRatio: (.6 / .8),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      // mainAxisExtent: 120,
                    ),
                    itemCount: sensor.sensorDeviceList.length,
                    itemBuilder: (BuildContext context, int index) {
                      // log(sensor.sensorDeviceList[0].toString());
                      return GridTile(child: SensorTile(sensorDevice: sensor.sensorDeviceList[index],));
                    },
                  ),
                ),
              ],
            ),
            // )
            // SizedBox(
            // height: MediaQuery.of(context).size.height,
            // width: MediaQuery.of(context).size.width,
            // child:
            // Padding(
            //   padding: const EdgeInsets.all(16.0),
            //   child: RefreshIndicator(
            //     onRefresh: _pullRefresh,
            //     child: GridView.builder(
            //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //           crossAxisCount: 2,
            //           childAspectRatio: 2 / 2,
            //         ),
            //         itemCount: sensor.sensorListTest.length,
            //         itemBuilder: (context, index) {
            //           return GridTile(child: SensorTile());
            //         }),
            //   ),
            // ),
            // ),
          ),
        ),
      );
    });
  }
}

Future<void> _pullRefresh() async {
  await Future.delayed(Duration(seconds: 2));
  log('pull to ref');
  // List<WordPair> freshWords = await WordDataSource().getFutureWords(delay: 2);
  // setState(() {
  //   words = freshWords;
  // });
  // why use freshWords var? https://stackoverflow.com/a/52992836/2301224
}
