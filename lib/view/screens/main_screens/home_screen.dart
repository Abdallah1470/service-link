import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 130,
        elevation: 0,
        backgroundColor: Color(0xFF00AEEF),
        title: Row(
          children: [
            Image.asset(
              'assets/images/img.png',
              height: 140,
              color: Colors.white,
              fit: BoxFit.contain,
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.menu,
              size: 30,
              color: Colors.black,
            ), // Matched size
            onPressed: () {/*
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Menu()),
              );*/
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
                      'icon': Icons.cleaning_services,
                      'label': 'Cleaning',
                      'page': CleaningPage()
                    },
                    {
                      'icon': Icons.build,
                      'label': 'Repairing',
                      'page': RepairingPage()
                    },
                    {
                      'icon': Icons.electrical_services,
                      'label': 'Electrician',
                      'page': ElectricianPage()
                    },
                    {
                      'icon': Icons.handyman,
                      'label': 'Carpenter',
                      'page': CarpenterPage()
                    },
                    {
                      'icon': Icons.build,
                      'label': 'Repairing',
                      'page': RepairingPage()
                    },
                    {
                      'icon': Icons.electrical_services,
                      'label': 'Electrician',
                      'page': ElectricianPage()
                    },
                    {
                      'icon': Icons.handyman,
                      'label': 'Carpenter',
                      'page': CarpenterPage()
                    },
                    {
                      'icon': Icons.build,
                      'label': 'Repairing',
                      'page': RepairingPage()
                    },
                    {
                      'icon': Icons.more_horiz,
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

// Example pages for navigation
class CleaningPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cleaning Service')),
      body: Center(child: Text('Welcome to the Cleaning Service Page!')),
    );
  }
}

class RepairingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Repairing Service')),
      body: Center(child: Text('Welcome to the Repairing Service Page!')),
    );
  }
}

class ElectricianPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Electrician Service')),
      body: Center(child: Text('Welcome to the Electrician Service Page!')),
    );
  }
}

class CarpenterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Carpenter Service')),
      body: Center(child: Text('Welcome to the Carpenter Service Page!')),
    );
  }
}

class MorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('More Services')),
      body: Center(child: Text('Welcome to the More Services Page!')),
    );
  }
}
