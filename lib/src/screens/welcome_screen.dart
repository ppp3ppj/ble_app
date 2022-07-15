import 'dart:developer';

import 'package:ble_app/src/global/global_text.dart';
import 'package:ble_app/src/models/functional_data_model/ble_device_interaction_view_model.dart';
import 'package:ble_app/src/provider/ble/ble_model_provider.dart';
import 'package:ble_app/src/routes/router.gr.dart';
import 'package:ble_app/src/screens/ble_screen/ble_status_screen.dart';
import 'package:ble_app/src/screens/ble_screen/devices_list_screen/ble_device_list.dart';
import 'package:ble_app/src/services/ble/ble_device_connector.dart';
import 'package:ble_app/src/services/ble/ble_device_interactor.dart';
import 'package:ble_app/src/utilities/config/size_config.dart';
import 'package:ble_app/src/widgets/information/information_dialog_widget.dart';
// import 'package:ble_app/src/widgets/information/information_dialog_widget.dart';
import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

    // context.watch<BleModelProvider>().getBleConfig();
  @override
  Widget build(BuildContext context) => Consumer<BleStatus?>(
        builder: (_, status, __) {
          context.watch<BleModelProvider>().getBleConfig();
          if (status == BleStatus.ready) {
            return 
            Consumer3<BleDeviceConnector, ConnectionStateUpdate, BleDeviceInteractor>(
              builder: (context, deviceConnector, connectionStateUpdate, serviceDiscoverer, child) { 
                return WelcomeScreenBleOK(
                viewModel: BleDeviceInteractionViewModel(
                  deviceId: context.read<BleModelProvider>().bleDevice.bleId.toString(),
                  connectionStatus: connectionStateUpdate.connectionState,
                  deviceConnector: deviceConnector,
                  discoverServices: () =>
                    serviceDiscoverer.discoverServices(context.read<BleModelProvider>().bleDevice.bleId.toString())), 
                ); 
              // ),
              }
            );
          } else {
            return BleStatusScreen(status: status ?? BleStatus.unknown);
          }
        },
      );
}

class WelcomeScreenBleOK extends StatelessWidget {
  const WelcomeScreenBleOK({
    required this.viewModel,
    Key? key
  }) : super(key: key);
  
 final BleDeviceInteractionViewModel viewModel;
  // BleDeviceInteractionViewModel viewModel = BleDeviceInteractionViewModel(
  //                 deviceId: deviceId, 
  //                 connectionStatus: connectionStatus, 
  //                 deviceConnector: deviceConnector, 
  //                 discoverServices: discoverServices
  //               );
  @override
  Widget build(BuildContext context) {
    // context.watch<BleModelProvider>().getBleConfig();
    return 
    Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(32.5),
        child: ListView(
          children: [
            // SizedBox(
            // height: MediaQuery.of(context).size.height * 0.1,
            // ),
            GlobalText(
              text: 'การประยุกต์ใช้\nโครงข่ายเซ็นเซอร์ไร้สาย\nในสวนผลไม้',
              fontSize: 30,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            //! add svg or gif
            // InkWell(
            // onTap: () {
            // log('Information Dialog');
            // informationDialog(context);
            // },
            // child:
            //  InkWell(
            // onTap: (){
            // informationDialog(context);
            //TODO: information screen for show information device connect uuid all : do when you can connect ble via app + esp32
            // context.router.pushNamed('/Information'); //! go to homepage
            // },
            //  child:
            InkWell(
              onTap: () {
                context.router.pushNamed('/BleDeviceList');
                // context.router.push(BleDeviceListScreen());
                log('Tap to scan screen');
                // Navigator.push<void>(context, MaterialPageRoute(builder: (_) => BleDeviceListScreen()));
              },
              child: Container(
                height: 213,
                child: SvgPicture.asset("assets/images/icons/screen1.svg"),
              ),
            ),
            //  ),
            // ),
            // Container(
            //   height: 240,
            //   child: Image.asset(
            //     "assets/images/icons/screen1_animation.gif",
            //   ),
            // ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            // GlobalText(text: 'Hive :${Provider.of<BleModelProvider>(context, listen: false).bleDevice.toJson()}',fontSize: 14, textAlign: TextAlign.center,),
            GlobalText(text: "HIVE is " + context.read<BleModelProvider>().bleDevice.bleId.toString() + " " +context.read<BleModelProvider>().bleDevice.bleName.toString(), textAlign: TextAlign.center,),
            // GlobalText(text: context.read<BleModelProvider>().bleDevice.bleName.toString()),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.12,
              // height: MediaQuery.of(context).size.height * 0.01,
            ),

            //TODO: Add connect and disconnect
            InkWell(
              onTap: () async {
                // viewModel.connect(); 
                //  log(await viewModel.discoverServices.toString());
                context.router.pushNamed('/home/'); //! go to homepage

              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(26.5),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFf6925c),
                      Color(0xFFf37552),
                    ],
                  ),
                ),
                child: const Center(
                  child: GlobalText(
                    text: 'Connect',
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                // viewModel.disconnect();
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(26.5),
                  color: Colors.white,
                ),
                child: const Center(
                    child: GlobalText(
                  text: 'Disconnect',
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                )),
              ),
            ),
            InkWell(
              onTap: () {
                !viewModel.deviceConnected ? viewModel.connect() : null ;
              },
              child: _testConnect[0]
            ),
            InkWell(
              onTap: () {
                viewModel.deviceConnected ? viewModel.disconnect() : null ;
                // viewModel.disconnect();

              },
              child: _testConnect[1]
            ),
            InkWell(
              onTap: () {
                viewModel.deviceConnected 
                  ? Provider.of<BleModelProvider>(context, listen: false).discoverServices(viewModel)
                  : null ;
                log(context.read<BleModelProvider>().discoveredServices.length.toString());
                context.read<BleModelProvider>().discoveredServices.forEach((element) {
                  log('pppp' + element.toString());
                });
                // viewModel.deviceConnected ? discoverSer
              },
              child: _testConnect[2]
            ),
          ],
        ),
      ),
    );
  }
 
}

 //! for test connect
List<Widget> _testConnect = [
     Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26.5),
        color: Colors.white,
      ),
      child: const Center(
          child: GlobalText(
        text: 'Connect_test',
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      )),
    ),
    Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26.5),
        color: Colors.white,
      ),
      child: const Center(
          child: GlobalText(
        text: 'Disconnect_test',
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      )),
    ),
    Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26.5),
        color: Colors.white,
      ),
      child: const Center(
          child: GlobalText(
        text: 'Discovery Services Ble test',
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      )),
    ),
  // ),
];


