import 'package:flutter/material.dart';
import 'package:route_tracking_ui/custom/customContainer.dart';
import 'package:route_tracking_ui/custom/customTextField.dart';
import 'package:route_tracking_ui/custom/custombutton.dart';
import 'package:route_tracking_ui/util/RouteName.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailctrl = TextEditingController();
  final passwordctrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Stack(
          clipBehavior: Clip.none, // Ensures content can overflow the Card
          children: [
            // Card
            Card(
              elevation: 5,
              child: container(
                Height: height * 0.6, // Adjusted height
                Width: width * 0.85, // Adjusted width for better fit on all screens
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                      SizedBox(height: 40,),
                    const Text(
                      "Welcome Back",
                      style:
                      TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: height * 0.01), // Dynamic height based on screen size
                    Text(
                      "Please log in to continue",
                      style: TextStyle(
                          fontSize: 16, color: Colors.grey[600]),
                    ),
                    SizedBox(height: height * 0.05), // Dynamic height
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                      child: Customtextfield(
                        cotroller: emailctrl,
                        hintText: "Enter Email",
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon: Icons.email,
                      ),
                    ),
                    SizedBox(height: height * 0.02), // Dynamic spacing
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                      child: Customtextfield(
                        cotroller: passwordctrl,
                        hintText: "Enter Password",
                        keyboardType: TextInputType.text,
                        prefixIcon: Icons.password,
                        suffixIcon: Icons.remove_red_eye,
                      ),
                    ),
                    SizedBox(height: height * 0.03), // Dynamic height
                    button(
                      "Login",
                      Colors.teal,
                          () {
                        setState(() {
                          Navigator.pushNamed(context, RouteName.passenerhome);
                        });
                      },
                      const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                      context,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("New to our Platform? "),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, RouteName.signup);
                          },
                          child: const Text(
                            "Create an Account",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RouteName.admin);
                      },
                      child: const Text(
                        "Log in to admin",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ),
                    // Container(
                    //   height: height * 0.1, // Dynamic height at the bottom
                    // ),
                  ],
                ),
              ),
            ),

            // "Login" Text Positioned
            Positioned(
              top: -height * 0.05, // Dynamically positioned above the Card
              left: (width * 0.85) / 2 - 80, // Centering based on width
              child: Container(
                height: 80,
                width: 160,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
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
