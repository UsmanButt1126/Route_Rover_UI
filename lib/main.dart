import 'package:flutter/material.dart';
import 'package:route_tracking_ui/Admin.dart';
import 'package:route_tracking_ui/BusRecommendation.dart';
import 'package:route_tracking_ui/home.dart';
import 'package:route_tracking_ui/login.dart';
import 'package:route_tracking_ui/passengerHome.dart';
import 'package:route_tracking_ui/signup.dart';
import 'package:route_tracking_ui/splash_screen.dart';
import 'package:route_tracking_ui/stopfinder.dart';
import 'package:route_tracking_ui/util/RouteManae.dart';
import 'package:route_tracking_ui/util/RouteName.dart';

import 'BusTrack.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        ),
      //  home:  const SplashScreen(                                                                                                    ),
      initialRoute: RouteName.splashscreen,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
