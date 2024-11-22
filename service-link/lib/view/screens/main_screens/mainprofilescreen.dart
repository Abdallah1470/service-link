import 'package:flutter/material.dart';
import 'package:service_link/view/screens/main_screen.dart';
import 'package:service_link/view/screens/main_screens/home_screen.dart';


void main() {
  runApp(MaterialApp(home: DetailRow(icon: Icons.arrow_back_outlined, detail: '',)));
}

class ProfileScreen extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String experience;
  final String profession;

  ProfileScreen({
    required this.name,
    required this.imageUrl,
    required this.experience,
    required this.profession,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
leading: IconButton(
  onPressed: () {
    Navigator.pop(context); // Go back to the MainScreen
  },
  icon: Icon(Icons.arrow_back), // Use an appropriate back arrow icon
),
       
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
                  child: Image.asset('assets/banner.jpg', fit: BoxFit.cover),
                ),
                Positioned(
                  top: 100,
                  left: MediaQuery.of(context).size.width / 2 - 50,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/profile.jpg'),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.grey[300],
                        child: Icon(Icons.camera_alt, color: Colors.black, size: 15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Name and Details
            SizedBox(height: 10),
            Text(
              'Kirollos N Gaprah',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              '15 years experience',
              style: TextStyle(color: Colors.grey[700], fontSize: 16 ),
            ),
            Text(
              'Lawyer',
              style: TextStyle(color: Colors.black, fontSize: 16 ,fontWeight: FontWeight.bold),
            ),

            // Buttons: Add to Story and Edit Profile
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.call),
                    label: Text('Call   '),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                  ),
                  OutlinedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.messenger),
                    label: Text('Watsapp'),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.grey),
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green[500],
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TabButton(title: 'Information'),
                
              ],
            ),
            Divider(),

            // Details Section
                      Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DetailRow(icon: Icons.work, detail: 'Lawer'),
                   DetailRow(icon: Icons.star_border, detail: '15 yaers experiance'),
                   DetailRow(icon: Icons.location_on, detail: 'Work in Cairo, Egypt'),
                   DetailRow(icon: Icons.home, detail: 'Lives in Cairo, Egypt'),
                   DetailRow(icon: Icons.person, detail: '40 years old'),
                   DetailRow(icon: Icons.person, detail: 'Male'),
                  SizedBox(height: 10),
          Divider(),
                ],
              ),
            ),
            // Review Section in the Profile Page
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  child: Column(
    children: [
      ReviewItem(
        name: 'Sofian Moaz',
        profilePic: 'assets/profile1.jpg', // Replace with your image path
        reviewDate: '4 May 2024',
        reviewText: 'غالى شوية بس شغله نضيف اوى وسريع ',
        rating: 4,
      ),
      Divider(),
      ReviewItem(
        name: 'Kerollos Gamil',
        profilePic: 'assets/profile2.jpg', // Replace with your image path
        reviewDate: '3 February 2024',
        reviewText: 'الراجل شغله 10 من 10',
        rating: 5,
      ),
      Divider(),
    ],
  ),
),

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
              color: isSelected ? Colors.blue : Colors.grey[600], // Change color to blue when selected
            ),
          ),
          if (isSelected)
            Container(
              margin: EdgeInsets.only(top: 5),
              height: 2,
              width: 40,
              color: Colors.blue, // Underline color
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
      padding: const EdgeInsets.symmetric(vertical: 4),
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







// Reusable Widget for Reviews

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

        // Verified Purchase and Review Details
        Text(
          "{Very Good}",
          style: TextStyle(color: Colors.green, fontSize: 12),
        ),
        Text(
          "Reviewed in Germany on $reviewDate",
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
