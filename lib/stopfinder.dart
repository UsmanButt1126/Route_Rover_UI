import 'package:flutter/material.dart';
import 'package:route_tracking_ui/custom/customContainer.dart';
import 'package:route_tracking_ui/custom/customTextField.dart';
import 'package:route_tracking_ui/custom/custombutton.dart';
import 'package:route_tracking_ui/util/RouteName.dart';

class BusStopFinder extends StatefulWidget {
  const BusStopFinder({super.key});

  @override
  State<BusStopFinder> createState() => _BusStopFinderState();
}

class _BusStopFinderState extends State<BusStopFinder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            // Stack widget to overlay the back button on the image
            Stack(
              children: [
                container(
                  Height: MediaQuery.of(context).size.height * 0.4,
                  Width: MediaQuery.of(context).size.width * 1,
                  child: Image.network(
                    "https://www.shutterstock.com/image-vector/flat-people-waiting-city-public-600nw-2041899749.jpg",
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 10,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      Navigator.pushNamed(context, RouteName.passenerhome); // Go back to the previous screen
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Customtextfield(
                hintText: "Enter your Current Location",
                prefixIcon: Icons.location_on,
              ),
            ),
            SizedBox(height: 15),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, RouteName.trackBusStop);
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    "Check Nearby Stop",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
