import 'package:ble_app/src/global/global_text.dart';
import 'package:ble_app/src/routes/router.gr.dart';
import 'package:ble_app/src/utilities/config/size_config.dart';
import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);
    // double width = SizeConfig.screenW!;
    // double height = SizeConfig.screenH!;
    // double blockH = SizeConfig.blockH!;
    // double blockV = SizeConfig.blockV!;
    return Scaffold(
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
            Container(
              height: 213,
              child: SvgPicture.asset("assets/images/icons/screen1.svg"),
            ),
            // Container(
            //   height: 240,
            //   child: Image.asset(
            //     "assets/images/icons/screen1_animation.gif",
            //   ),
            // ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            // GlobalText(text: 'การประยุกต์ใช้\nโครงข่ายเซ็นเซอร์ไร้สาย\nในสวนผลไม้',fontSize: 30, textAlign: TextAlign.center,),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            // GlobalText(text: 'Project : PPPP',fontSize: 30, textAlign: TextAlign.center,),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.13,
              // height: MediaQuery.of(context).size.height * 0.01,
            ),
            //TODO: Add connect and disconnect
            InkWell(
              onTap: () {
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
            Container(
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
          ],
        ),
      ),

      // appBar: AppBar(
      //   title: const Text('Welcome Screen'),
      // ),

      // Center(
      //   child: ElevatedButton(
      //     onPressed: () {
      //     //  context.pushRoute() o
      //     // context.pushRoute(route)
      //     // context.navigateNamedTo('/DevicesList');
      // context.router.pushNamed('/home/');
      //     // context.pushRoute(HomeScreen());
      //     },
      //     child: const Text('Ready'),
      //   ),
      // ),
    );
  }
}
