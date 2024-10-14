import 'package:flutter/material.dart';
import 'package:service_link/view/screens/main_screen.dart';
import 'package:service_link/view/screens/main_screens/CameraPage.dart';
import 'package:service_link/view/screens/main_screens/DoctorPage.dart';
import 'package:service_link/view/screens/main_screens/DriverPage.dart';
import 'package:service_link/view/screens/main_screens/ElectricianPage.dart';
import 'package:service_link/view/screens/main_screens/TeacherPage.dart';
import 'package:service_link/view/screens/main_screens/WorkerPage.dart';
import 'package:service_link/view/screens/main_screens/CleaningPage.dart';
import 'package:service_link/view/screens/main_screens/EngineerPage.dart';

import 'package:service_link/view/screens/main_screens/Menu.dart';
import 'package:service_link/view/screens/main_screens/NotificationPage.dart';
import 'package:service_link/view/screens/main_screens/OrderingPage.dart';
import 'package:service_link/view/screens/main_screens/Plumbing.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        backgroundColor: Colors.greenAccent[200],
        elevation: 40,

        title: Text('Service Link',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            )),
        leading: IconButton(
          icon: Icon(
            Icons.menu_outlined,
            size: 30,
            color: Colors.black,
          ), // Matched size
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications_active_outlined,
              size: 30,
              color: Colors.black,
            ), // Matched size
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationPage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'I want to hire a...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Services',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.9, // Fine-tuned size ratio
                ),
                itemCount: 9,
                itemBuilder: (context, index) {
                  List<Map<String, dynamic>> services = [
                    {
                      'icon': Icons.cleaning_services_outlined,
                      'label': 'Cleaning',
                      'page': CleaningPage()
                    },
                    {
                      'icon': Icons.medical_services_outlined,
                      'label': 'Doctor',
                      'page': DoctorPage()
                    },
                    {
                      'icon': Icons.drive_eta_outlined,
                      'label': 'Driver',
                      'page': DriverPage()
                    },
                    {
                      'icon': Icons.handyman_outlined,
                      'label': 'Worker',
                      'page': WorkerPage()
                    },
                    {
                      'icon': Icons.camera_alt_outlined,
                      'label': 'Photographer',
                      'page': CameraPage()
                    },
                    {
                      'icon': Icons.electrical_services_outlined,
                      'label': 'Electrician',
                      'page': ElectricianPage()
                    },
                    {
                      'icon': Icons.engineering_outlined,
                      'label': 'Engineer',
                      'page': EngineerPage()
                    },
                    {
                      'icon': Icons.school_outlined,
                      'label': 'Teacher',
                      'page': TeacherPage()
                    },
                    {
                      'icon': Icons.more_horiz_outlined,
                      'label': 'More',
                      'page': MorePage()
                    },
                  ];
                  return GestureDetector(
                    onTap: () {
                      // Navigate to the corresponding page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => services[index]['page']),
                      );
                    },
                    child: ServiceCard(
                      icon: services[index]['icon'],
                      label: services[index]['label'],
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

class ServiceCard extends StatelessWidget {
  final IconData icon;
  final String label;

  ServiceCard({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Colors.black), // Larger icon size
          SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
class MorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('More Services'),
      ),
      body: Center(
        child: Text(
          'Later ...',
          style: TextStyle(fontSize: 22), // Correct placement of style
        ),
      ),
    );
  }
}
