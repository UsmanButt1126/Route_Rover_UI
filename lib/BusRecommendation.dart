import 'package:flutter/material.dart';
import 'package:route_tracking_ui/custom/customContainer.dart';
import 'package:route_tracking_ui/util/RouteName.dart';

class Busrecommendation extends StatefulWidget {
  final Map<String, String>? data; // Expecting arguments from previous screen
  const Busrecommendation({super.key, this.data});

  @override
  State<Busrecommendation> createState() => _BusrecommendationState();
}

class _BusrecommendationState extends State<Busrecommendation> {
  @override
  Widget build(BuildContext context) {
    final from = widget.data?['from'] ?? 'Unknown';
    final to = widget.data?['to'] ?? 'Unknown';

    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Image and Title
            Stack(
              children: [
                Opacity(
                  opacity: 0.6,
                  child: container(
                    Height: MediaQuery.of(context).size.height * 0.4,
                    Width: MediaQuery.of(context).size.width,
                    child: const Image(
                      image: AssetImage("Assets/images/tracking/trackingmamp.jpg"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.01,
                    child: IconButton(onPressed: (){
                      Navigator.pushNamed(context, RouteName.passenerhome);
                    }, icon: Icon(Icons.arrow_back))),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.2 - 21 / 2,
                  left: MediaQuery.of(context).size.width * 0.5 - 100,
                  child: const Text(
                    "Track Here",
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Recommended Buses Title
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Recommended Buses",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
              ),
            ),
            const SizedBox(height: 10),
            // List of Recommended Buses
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  String busName= "Bus ${index +1}";
                  return InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, RouteName.trackBus,
                      arguments: {
                        'from' : from,
                        'to' : to,
                        'busName': busName,
                      });
                    },
                    child: Card(
                      elevation: 2,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 3.0),
                      child: ListTile(
                        leading: const CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage(
                              "Assets/images/tracking/trackingmamp.jpg"),
                        ),
                        title: Text(busName),
                        subtitle: Text("$from to $to"),
                        trailing: const Text("Expected Time: 11:30 AM"),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
