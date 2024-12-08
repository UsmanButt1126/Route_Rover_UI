import 'package:flutter/material.dart';
import 'package:route_tracking_ui/custom/customContainer.dart';
import 'package:route_tracking_ui/custom/customTextField.dart';
import 'package:route_tracking_ui/util/RouteName.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageWithSidebarState();
}

class _AdminPageWithSidebarState extends State<AdminPage> {
  final dname = TextEditingController();
  final lnumber = TextEditingController();
  final contact = TextEditingController();

  List<Map<String, String>> driverData = [];
  List<Map<String, String>> busData = [];

  final busType = TextEditingController();
  final busNumber = TextEditingController();

  List<Map<String, String>> userData = [];
  String _selectedOption = "Dashboard"; // Default option
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    List<Map<String, String>> data = [];
    int count = sh.getInt("count") ?? 0;

    for (int i = 0; i < count; i++) {
      String? Fname = sh.getString('First_Name_$i');
      String? Lname = sh.getString("Last_Name_$i");
      String? email = sh.getString("Email_$i");
      if (email != null && Fname != null && Lname != null) {
        data.add({"First_Name": Fname, "Last_Name": Lname, "Email": email});
      }
    }
    setState(() {
      userData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Panel"),
        backgroundColor: Colors.teal,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.teal,
              ),
              child: Center(
                child: Text(
                  "Admin Menu",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
            _buildDrawerItem(
              title: "Dashboard",
              icon: Icons.dashboard,
              onTap: () => _updateSelectedOption("Dashboard"),
            ),
            _buildDrawerItem(
              title: "Passengers",
              icon: Icons.people,
              onTap: () => _updateSelectedOption("Passengers"),
            ),
            _buildDrawerItem(
              title: "Buses",
              icon: Icons.directions_bus,
              onTap: () => _updateSelectedOption("Buses"),
            ),
            _buildDrawerItem(
              title: "Drivers",
              icon: Icons.drive_eta,
              onTap: () => _updateSelectedOption("Drivers"),
            ),
            _buildDrawerItem(
                title: "Log out",
                icon: Icons.logout,
                onTap: () {
                  Navigator.pushNamed(context, RouteName.login);
                })
          ],
        ),
      ),
      body: Row(
        children: [
          // Sidebar for wider screens
          if (MediaQuery.of(context).size.width > 800)
            Container(
              color: Colors.teal.shade300,
              width: 250,
              child: ListView(
                children: [
                  const SizedBox(height: 16),
                  _buildDrawerItem(
                    title: "Dashboard",
                    icon: Icons.dashboard,
                    onTap: () => _updateSelectedOption("Dashboard"),
                  ),
                  _buildDrawerItem(
                    title: "Passengers",
                    icon: Icons.people,
                    onTap: () => _updateSelectedOption("Passengers"),
                  ),
                  _buildDrawerItem(
                    title: "Buses",
                    icon: Icons.directions_bus,
                    onTap: () => _updateSelectedOption("Buses"),
                  ),
                  _buildDrawerItem(
                    title: "Drivers",
                    icon: Icons.drive_eta,
                    onTap: () => _updateSelectedOption("Drivers"),
                  ),
                  _buildDrawerItem(
                    title: "Log out",
                    icon: Icons.logout,
                    onTap: () => Navigator.pushNamed(context, RouteName.login),
                  ),
                ],
              ),
            ),

          // Main content area
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: _buildContent(),
            ),
          ),
        ],
      ),
    );
  }

  // Function to Update the Selected Option
  void _updateSelectedOption(String option) {
    setState(() {
      _selectedOption = option;
    });
    if (MediaQuery.of(context).size.width <= 800) {
      Navigator.pop(context); // Close drawer on smaller screens
    }
  }

  // Function to Build Drawer Items
  Widget _buildDrawerItem({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon, color: Colors.black),
      onTap: onTap,
      textColor: Colors.black,
    );
  }

  // Function to Build Content Based on Selected Option
  Widget _buildContent() {
    switch (_selectedOption) {
      case "Dashboard":
        return _dashboard();
      case "Passengers":
        return _buildPassengerSection();
      case "Buses":
        return _buildBusSection();
      case "Drivers":
        return _buildDriverSection();
      default:
        return const Center(
          child: Text("Please select an option"),
        );
    }
  }

  Widget _buildPassengerSection() {
    return Column(
      children: [
        const Text(
          "Passenger List",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 50,
        ),
        userData.isEmpty
            ? const Center(child: Text("No data available"))
            : Expanded(
                child: ListView.builder(
                    itemCount: userData.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 4,
                        child: Column(
                          children: [
                            Text(
                                "First Name : ${userData[index]['First_Name']}"),
                            Text("Last Name : ${userData[index]["Last_Name"]}"),
                            Text("Email : ${userData[index]['Email']}"),
                          ],
                        ),
                      );
                    }),
              ),
      ],
    );
  }

  // Function to Build Bus Section
  Widget _buildBusSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Buses",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            _showAddBusDialog("Bus");
          },
          child: const Text("Add Bus"),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: ListView.builder(
            itemCount: busData.length, // Replace with your actual data count
            itemBuilder: (context, index) {
              final bus = busData[index];
              return Card(
                child: ListTile(
                  title: Text("Bus_Type : ${bus['type']}"),
                  subtitle: Text("Bus Number: ${bus['number']}"),
                  trailing: const Icon(Icons.edit),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // Function to Build Driver Section
  Widget _buildDriverSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Drivers",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            _showAddDriverDialog("Driver");
          },
          child: const Text("Add Driver"),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: ListView.builder(
            itemCount: driverData.length, // Replace with your actual data count
            itemBuilder: (context, index) {
              final driver = driverData[index];
              return Card(
                elevation: 4,
                child: ListTile(
                  title: Text("Name: ${driver['name']}"),
                  subtitle: Text("License: ${driver['license']}"),
                  trailing: Text("Contact: ${driver['contact']}"),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _dashboard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          "Welcome to the Dashboard",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.15),
        InkWell(
          onTap: () {
            _updateSelectedOption("Passengers");
          },
          child: container(
              Height: MediaQuery.of(context).size.height * 0.15,
              Width: MediaQuery.of(context).size.width * 0.7,
              Color: Colors.teal,
              child: const Center(child: Text("Check Passener"))),
        ),
       const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => _updateSelectedOption("Drivers"),
              child: container(
                  Height: MediaQuery.of(context).size.height * 0.15,
                  Width: MediaQuery.of(context).size.width * 0.35,
                  Color: Colors.teal,
                  child: const Center(child: Text("Check Buses"))),
            ),
            const SizedBox(
              width: 15,
            ),
            InkWell(
              onTap: () => _updateSelectedOption("Buses"),
              child: container(
                  Height: MediaQuery.of(context).size.height * 0.15,
                  Width: MediaQuery.of(context).size.width * 0.35,
                  Color: Colors.teal,
                  child: const Center(child: Text("Check Driver"))),
            ),

          ],
        ),
        const SizedBox(
          height: 15,
        ),
        InkWell(
          onTap: () {
            _updateSelectedOption("Passengers");
          },
          child: container(
              Height: MediaQuery.of(context).size.height * 0.15,
              Width: MediaQuery.of(context).size.width * 0.7,
              Color: Colors.teal,
              child: const Center(child: Text("Check Passener"))),
        ),
      ],
    );
  }

  // Function to Show Add Dialog
  void _showAddDriverDialog(String type) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(
              child: Text(
            "Add $type",
            style: const TextStyle(fontWeight: FontWeight.bold),
          )),
          content: SizedBox(
            height: 250, // Set the height you want
            width: 400, // Optionally set a width
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Customtextfield(
                    cotroller: dname, hintText: "Enter Driver Name"),
                const SizedBox(height: 15),
                Customtextfield(
                    cotroller: lnumber, hintText: "Enter License Number"),
                const SizedBox(height: 15),
                Customtextfield(
                    cotroller: contact, hintText: "Enter Contact Number"),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                driverData.add({
                  "name": dname.text,
                  "license": lnumber.text,
                  "contact": contact.text,
                });
                setState(() {});
                dname.clear();
                lnumber.clear();
                contact.clear();

                Navigator.pop(context);
                // Add logic to save the data
              },
              child: const Text("ADD"),
            ),
          ],
        );
      },
    );
  }

  void _showAddBusDialog(String type) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "Add $type",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            content: SizedBox(
              height: 200,
              width: 400,
              child: Column(
                children: [
                  Customtextfield(
                    hintText: "Enter Bus Type",
                    cotroller: busType,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Customtextfield(
                    hintText: "Enter Bus Number",
                    cotroller: busNumber,
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
              TextButton(
                  onPressed: () {
                    busData
                        .add({'type': busType.text, 'number': busNumber.text});
                    setState(() {});
                    busType.clear();
                    busNumber.clear();
                    Navigator.pop(context);
                  },
                  child: const Text("Add")),
            ],
          );
        });
  }
}
