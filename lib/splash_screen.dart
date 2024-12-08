import 'dart:async';

import 'package:flutter/material.dart';
import 'package:route_tracking_ui/util/RouteName.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, RouteName.onboarding);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,

      body:
      Center(
        child: Image(image: AssetImage("Assets/images/tracking/logo2.png")),
      ),
    );
  }
}
