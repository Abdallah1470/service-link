import 'package:flutter/material.dart';
import 'package:service_link/view/screens/main_screen.dart';
import 'package:service_link/view/screens/main_screens/DoctorPage.dart';
import 'package:service_link/view/screens/main_screens/home_screen.dart';
import 'package:service_link/view/screens/main_screens/mainprofilescreen.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined, color: Colors.black),
          onPressed: () {
            Navigator.pop(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
        ),
        title: Text(
          'Service Link',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          _buildMenuItem(
            icon: Icons.person_outline,
            text: 'My Profile',
            onTap: () {
    
  },
          ),
          _buildMenuItem(
            icon: Icons.contact_mail_outlined,
            text: 'Contact us',
            onTap: () {
              // Add navigation to Contact Us screen here
            },
          ),
          Divider(),
          _buildMenuItem(
            icon: Icons.construction_outlined,
            text: 'Become a worker',
            onTap: () {
              // Add navigation to Become a Worker screen here
            },
          ),
          _buildMenuItem(
            icon: Icons.business_outlined,
            text: 'Register a company',
            onTap: () {
              // Add navigation to Register a Company screen here
            },
          ),
          Divider(),
          _buildMenuItem(
            icon: Icons.share_outlined,
            text: 'Share',
            onTap: () {
              // Add sharing functionality here
            },
          ),
          _buildMenuItem(
            icon: Icons.star_outline,
            text: 'Rate',
            onTap: () {
              // Add navigation to Rate screen or functionality here
            },
          ),
          _buildMenuItem(
            icon: Icons.logout_outlined,
            text: 'Logout',
            onTap: () {
              // Add logout functionality here
            },
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Version 1.0',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
      {required IconData icon,
      required String text,
      required Function() onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey, size: 28),
      title: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18),
      onTap: onTap,
    );
  }
}
