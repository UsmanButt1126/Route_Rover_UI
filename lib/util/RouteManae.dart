import 'package:flutter/material.dart';
import 'package:route_tracking_ui/Admin.dart';
import 'package:route_tracking_ui/BusRecommendation.dart';
import 'package:route_tracking_ui/BusTrack.dart';
import 'package:route_tracking_ui/busStop.dart';
import 'package:route_tracking_ui/home.dart';
import 'package:route_tracking_ui/login.dart';
import 'package:route_tracking_ui/onbioarding.dart';
import 'package:route_tracking_ui/passengerHome.dart';
import 'package:route_tracking_ui/signup.dart';
import 'package:route_tracking_ui/splash_screen.dart';
import 'package:route_tracking_ui/stopfinder.dart';
import 'package:route_tracking_ui/util/RouteName.dart';

class Routes {
  static Route<dynamic>? generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case RouteName.home:
        return MaterialPageRoute(builder: (context) => SelelctUser());
      case RouteName.login:
        return MaterialPageRoute(builder: (context) => Login());
      case RouteName.signup:
        return MaterialPageRoute(builder: (context) => Signup());
      case RouteName.admin:
        return MaterialPageRoute(builder: (context) => AdminPage());
      case RouteName.passenerhome:
        return MaterialPageRoute(builder: (context) => Passengerhome());
      case RouteName.busRecommend:
      // Extract and validate arguments
        final args = setting.arguments;
        if (args is Map<String, String>) {
          return MaterialPageRoute(
            builder: (context) => Busrecommendation(data: args),
          );
        }
      case RouteName.trackBus:
        final argus = setting.arguments;
        if (argus is Map<String, String>) {
          return MaterialPageRoute(
            builder: (context) => BusTrack(data: argus),
          );
        }
      case RouteName.busstop:
        return MaterialPageRoute(builder: (context)=>BusStopFinder());
      case RouteName.trackBusStop:
        return MaterialPageRoute(builder: (context)=>BusStopTracking());
      case RouteName.splashscreen:
        return  MaterialPageRoute(builder: (context)=>SplashScreen());
      case RouteName.onboarding:
        return MaterialPageRoute(builder: (context)=>OnboardingScreen());
        default:
        return MaterialPageRoute(
          builder: (context) => ErrorPage(message: "Unknown route: ${setting.name}"),
        );
    }
  }
}

class ErrorPage extends StatelessWidget {
  final String message;

  const ErrorPage({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Error")),
      body: Center(
        child: Text(message, style: const TextStyle(fontSize: 18)),
      ),
    );
  }
}
