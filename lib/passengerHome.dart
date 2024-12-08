import 'package:flutter/material.dart';
import 'package:route_tracking_ui/custom/customContainer.dart';
import 'package:route_tracking_ui/custom/customTextField.dart';
import 'package:route_tracking_ui/custom/custombutton.dart';
import 'package:route_tracking_ui/util/RouteName.dart';

class Passengerhome extends StatefulWidget {
  const Passengerhome({super.key});

  @override
  State<Passengerhome> createState() => _PassengerhomeState();
}

class _PassengerhomeState extends State<Passengerhome> {
  final fromController = TextEditingController();
  final toController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Passenger Home"),
          backgroundColor: Colors.teal,
        ),
        backgroundColor: Colors.white,
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.teal,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.person,
                        color: Colors.teal,
                        size: 40,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Welcome, User",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.logout, color: Colors.teal),
                title: Text("Logout"),
                onTap: () {
                  Navigator.pushReplacementNamed(context, RouteName.login);
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Top Image
              container(
                Height: MediaQuery.of(context).size.height * 0.3,
                Width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  "Assets/images/tracking/tracki.png",
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 15),
              // Title
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Where to?",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              // From Input
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Customtextfield(
                  hintText: "From",
                  cotroller: fromController,
                ),
              ),
              const SizedBox(height: 15),
              // To Input
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Customtextfield(
                  hintText: "To",
                  cotroller: toController,
                ),
              ),
              const SizedBox(height: 15),
              // Search Button
              button(
                "Search",
                Colors.teal,
                    () {
                  if (fromController.text.isNotEmpty &&
                      toController.text.isNotEmpty) {
                    Navigator.pushNamed(
                      context,
                      RouteName.busRecommend,
                      arguments: {
                        "from": fromController.text.trim(),
                        "to": toController.text.trim(),
                      },
                    );
                    setState(() {
                      fromController.clear();
                      toController.clear();
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                            "Please enter both 'From' and 'To' locations."),
                      ),
                    );
                  }
                },
                const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                context,
              ),
              const SizedBox(height: 15),
              // Divider
              const Divider(
                color: Colors.black,
                thickness: 0.7,
                indent: 20,
                endIndent: 20,
              ),
              const SizedBox(height: 30),
              // Options Section
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildOptionCard(
                      context,
                      title: "Track Bus",
                      imagePath: "Assets/images/tracking/busStop.jpg",
                      onTap: () {
                        Navigator.pushNamed(context, RouteName.busRecommend,
                            arguments: {
                              "from": fromController.text.trim(),
                              "to": toController.text.trim(),
                            });
                      },
                    ),
                    _buildOptionCard(
                      context,
                      title: "Check Bus Stop",
                      imagePath: "Assets/images/tracking/busstop1.jpg",
                      onTap: () {
                        Navigator.pushNamed(context, RouteName.busstop);
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionCard(BuildContext context,
      {required String title,
        required String imagePath,
        required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            Opacity(
              opacity: 0.4,
              child: container(
                Height: MediaQuery.of(context).size.height * 0.3,
                Width: MediaQuery.of(context).size.width * 0.7,
                Color: Colors.teal,
                child: Image.asset(imagePath, fit: BoxFit.fill),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.15 - 21 / 2,
              left: MediaQuery.of(context).size.width * 0.35 - 150 / 2,
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
