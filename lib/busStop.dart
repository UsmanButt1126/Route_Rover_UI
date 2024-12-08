import 'package:flutter/material.dart';
import 'package:route_tracking_ui/custom/customContainer.dart';
import 'package:route_tracking_ui/util/RouteName.dart';

class BusStopTracking extends StatefulWidget {
  const BusStopTracking({super.key});

  @override
  State<BusStopTracking> createState() => _BusStopTrackingState();
}

class _BusStopTrackingState extends State<BusStopTracking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          container(Height: MediaQuery.of(context).size.height*0.8,
              Width: MediaQuery.of(context).size.width*1,
              child: Image(image: AssetImage("Assets/images/tracking/img.png"), fit: BoxFit.fill,)),
          SizedBox(height: 15,),
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, RouteName.busstop);
            },
            child: Container(
              height: MediaQuery.of(context).size.height*0.07,
              width: MediaQuery.of(context).size.width*0.8,
              decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(12)
              ),
              child: Center(child: Text("Back",
                style: TextStyle(
                    fontWeight: FontWeight.bold , fontSize: 21
                ),)),
            ),
          )
        ],
      ),
    );
  }
}
