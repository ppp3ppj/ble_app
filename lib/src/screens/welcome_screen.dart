import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
          //  context.pushRoute() o
          // context.pushRoute(route)
          context.navigateNamedTo('/DevicesList');
          },
          child: const Text('Ready'),
        ),
      ),
    );
  }
}