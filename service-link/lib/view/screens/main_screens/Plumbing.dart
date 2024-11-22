import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ServiceDetailsScreen(),
    );
  }
}

class ServiceDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            // Back action
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.bookmark_outline, color: Colors.black),
            onPressed: () {
              // Bookmark action
            },
          ),
          IconButton(
            icon: Icon(Icons.share_outlined, color: Colors.black),
            onPressed: () {
              // Share action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                      'assets/plumber.png'), // Replace with your image
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Plumbing Services',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Milan Jack',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Icon(Icons.location_on, color: Colors.grey, size: 18),
                  SizedBox(width: 5),
                  Text(
                    '2464 Royal Ln. Mesa, New Jersey 45463',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      text: '\$20/hr ',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: '4.9 ',
                          style: TextStyle(color: Colors.black),
                        ),
                        WidgetSpan(
                          child:
                              Icon(Icons.star, color: Colors.amber, size: 16),
                        ),
                        TextSpan(
                          text: ' (120 Reviews)',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildTabOption('About Me', isSelected: true),
                        _buildTabOption('Experts'),
                        _buildTabOption('Reviews'),
                        _buildTabOption('Gallery'),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Contrary to popular belief, lorem ipsum is not simply random text. "
                      "It has roots in a piece of classical Latin literature from 45 BC, "
                      "making it over 2000 years old. Richard McClintock, a Latin professor at "
                      "Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur.",
                      style: TextStyle(color: Colors.grey[800], height: 1.5),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'read more...',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Text('Message'),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.blue),
                        padding: EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Book Now'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabOption(String title, {bool isSelected = false}) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: isSelected ? Colors.black : Colors.grey,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        SizedBox(height: 5),
        if (isSelected)
          Container(
            height: 3,
            width: 60,
            color: Colors.blue,
          ),
      ],
    );
  }
}
