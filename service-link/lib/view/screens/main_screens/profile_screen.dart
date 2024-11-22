import 'package:flutter/material.dart';
import 'package:service_link/view/screens/main_screen.dart';
import 'package:service_link/view/screens/main_screens/home_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MainScreen()), // Navigate back to main screen
            );
          },
          icon: Icon(Icons.arrow_back_outlined, color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(Icons.edit, color: Colors.black),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header Section
            Stack(
              children: [
                // Background Banner
                Container(
                  height: 150,
                  color: Colors.grey[200],
                  child: Image.asset(
                    'assets/images/profile.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                // Profile Picture with Colored Frame
                Positioned(
                  top: 100,
                  left: MediaQuery.of(context).size.width / 2 - 60, // Adjusted for frame
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent, width: 4), // Colored frame
                      borderRadius: BorderRadius.circular(20), // Rounded corners
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16), // Inner image rounded corners
                      child: Image.asset(
                        'assets/images/profile.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Spacing to accommodate the overlapping profile picture
            SizedBox(height: 30),
            // Name and Details
            Text(
              'Kirollos N Gaprah',
              style: TextStyle(
                fontSize: 24, 
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5),
            Text(
              '15 years experience',
              style: TextStyle(
                color: Colors.grey[700], 
                fontSize: 16,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Lawyer',
              style: TextStyle(
                color: Colors.black, 
                fontSize: 18, 
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            // Buttons: Information (Removed as per your request)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TabButton(title: 'Information', isSelected: true),
              ],
            ),
            Divider(thickness: 1, color: Colors.grey[300]),
            // Details Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DetailRow(icon: Icons.work, detail: 'Lawyer'),
                  DetailRow(icon: Icons.home, detail: 'Lives in Cairo, Egypt'),
                  DetailRow(icon: Icons.person, detail: '40 years old'),
                  DetailRow(icon: Icons.person, detail: 'Male'),
                  SizedBox(height: 10),
                  Divider(thickness: 1, color: Colors.grey[300]),
                ],
              ),
            ),
            // Review Section (Optional: Add your reviews here)
          ],
        ),
      ),
    );
  }
}

// Reusable Widget for Tabs
class TabButton extends StatelessWidget {
  final String title;
  final bool isSelected;

  TabButton({required this.title, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.black : Colors.grey[600],
            ),
          ),
          if (isSelected)
            Container(
              margin: EdgeInsets.only(top: 5),
              height: 2,
              width: 40,
              color: Colors.blueAccent,
            ),
        ],
      ),
    );
  }
}

// Reusable Widget for Details Row
class DetailRow extends StatelessWidget {
  final IconData icon;
  final String detail;

  DetailRow({required this.icon, required this.detail});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey[600]),
          SizedBox(width: 10),
          Text(
            detail,
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
        ],
      ),
    );
  }
}

// Reusable Widget for Reviews (Optional)
class ReviewItem extends StatelessWidget {
  final String name;
  final String profilePic;
  final String reviewDate;
  final String reviewText;
  final int rating;

  ReviewItem({
    required this.name,
    required this.profilePic,
    required this.reviewDate,
    required this.reviewText,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Profile Picture and Name
        Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(profilePic),
              radius: 20,
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: List.generate(5, (index) {
                    return Icon(
                      index < rating ? Icons.star : Icons.star_border,
                      color: Colors.orange,
                      size: 16,
                    );
                  }),
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: 10),

        // Review Details
        Text(
          "Reviewed on $reviewDate",
          style: TextStyle(color: Colors.grey, fontSize: 12),
        ),

        SizedBox(height: 10),

        // Review Text
        Text(
          reviewText,
          style: TextStyle(fontSize: 14),
        ),

        SizedBox(height: 10),

        // Buttons (Helpful, Share, Report)
        Row(
          children: [
            TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.thumb_up, size: 18),
              label: Text('Helpful'),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}
