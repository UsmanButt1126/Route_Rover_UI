import 'package:flutter/material.dart';
import 'package:route_tracking_ui/util/RouteName.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // PageView for onboarding screens
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                isLastPage = (index == 4); // Update when on the last page
              });
            },
            children: [
              OnboardingPage(
                title: "Welcome to Bus Tracker!",
                description:
                "Your go-to solution for real-time bus tracking and seamless booking.",
                imagePath: "Assets/images/tracking/citymaplive.png",
              ),
              OnboardingPage(
                title: "Track Buses in Real-Time",
                description:
                "Stay updated on bus locations and arrival times with precision.",
                imagePath: "Assets/images/tracking/trackBus.webp",
              ),
              OnboardingPage(
                title: "Hassle-Free Booking",
                description:
                "Easily book your ride and check fare prices before you board.",
                imagePath: "Assets/images/tracking/busarrival-removebg-preview.png",
              ),
              OnboardingPage(
                title: "Stay Notified",
                description:
                "Get reminders and alerts about bus stops and timings.",
                imagePath: "Assets/images/tracking/busArriving._1__1_-removebg-preview.png",
              ),
              OnboardingPage(
                title: "Experience Augmented Reality",
                description:
                "Use AR to locate bus stops and see detailed route info.",
                imagePath: "Assets/images/tracking/AR.png",
              ),
            ],
          ),

          // Bottom navigation: dots + buttons
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Column(
              children: [
                SmoothPageIndicator(
                  controller: _controller,
                  count: 5,
                  effect: ExpandingDotsEffect(
                    activeDotColor: Colors.blue,
                    dotColor: Colors.grey,
                    dotHeight: 10,
                    dotWidth: 10,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Skip Button
                    TextButton(
                      onPressed: () {
                        // Skip to main screen
                        Navigator.pushNamed(context, RouteName.home);
                      },
                      child: Text("Skip"),
                    ),

                    // Next or Get Started Button
                    ElevatedButton(
                      onPressed: () {
                        if (isLastPage) {
                          // Navigate to main screen
                          Navigator.pushNamed(context, RouteName.home);
                        } else {
                          // Go to the next page
                          _controller.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: Text(isLastPage ? "Get Started" : "Next"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// A single onboarding page widget
class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  OnboardingPage({
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, height: 300, ), // Replace with your image
          SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            description,
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// Dummy main screen after onboarding
