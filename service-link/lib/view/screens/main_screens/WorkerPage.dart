import 'package:flutter/material.dart';
import 'package:service_link/view/screens/main_screen.dart';
import 'package:service_link/view/screens/main_screens/OrderingPage.dart';
import 'package:service_link/view/screens/main_screens/mainprofilescreen.dart';


class WorkerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF00AEEF),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainScreen()),
            );
          },
        ),
        title: Text(
          'Workers',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  hintText: 'Search Workers...',
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Image.asset(
                        'assets/images/Coaching.png',
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Get 40%',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        Text(
                          "Today's Specials!",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recommended',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 10),
               Container(
                  height: 312,
                 child: ListView(
                  scrollDirection: Axis.horizontal,
                   children: [
                     DoctorCard(
                       imagePath: 'assets/images/worker1.jpg',
                       name: 'Mr. Mark Alonso',
                       specialty: 'Carpenter',
                       experience: '10 years',
                       qualification: 'Wood Works Diploma',
                       rating: 4.8,
                       workRegion: 'New York, NY',
                       priceStart: 150.0,
                       onTap: () {
                         Navigator.push(
                           context,
                           MaterialPageRoute(
                             builder: (context) => DoctorProfile(
                              imagePath: 'assets/images/worker1.jpg',
                       name: 'Mr. Mark Alonso',
                       specialty: 'Carpenter',
                       experience: '10 years',
                       qualification: 'Wood Works Diploma',
                       rating: 4.8,
                       workRegion: 'New York, NY',
                       priceStart: 150.0,
                             ),
                           ),
                         );
                       },
                     ),
                     DoctorCard(
                       imagePath: 'assets/images/worker6.jpg',
                       name: 'Mr. Ahmed Gamal',
                       specialty: 'Wood Works',
                       experience: '15 years',
                       qualification: 'Wood Works Diploma',
                       rating: 4.7,
                       workRegion: 'Cairo, Egypt',
                       priceStart: 200.0,
                       onTap: () {
                         Navigator.push(
                           context,
                           MaterialPageRoute(
                             builder: (context) => DoctorProfile(
                               imagePath: 'assets/images/worker6.jpg',
                       name: 'Mr. Ahmed Gamal',
                       specialty: 'Wood Works',
                       experience: '15 years',
                       qualification: 'Wood Works Diploma',
                       rating: 4.7,
                       workRegion: 'Cairo, Egypt',
                       priceStart: 200.0,
                             ),
                           ),
                         );
                       },
                     ),
                     DoctorCard(
                       imagePath: 'assets/images/worker8.jpg',
                       name: 'Mr. Edward Weston',
                       specialty: 'Garden Works',
                       experience: '8 years',
                       qualification: 'Gardens Care Diploma',
                       rating: 4.9,
                       workRegion: 'San Francisco, CA',
                       priceStart: 180.0,
                       onTap: () {
                         Navigator.push(
                           context,
                           MaterialPageRoute(
                             builder: (context) => DoctorProfile(
                              imagePath: 'assets/images/worker8.jpg',
                       name: 'Mr. Edward Weston',
                       specialty: 'Garden Works',
                       experience: '8 years',
                       qualification: 'Gardens Care Diploma',
                       rating: 4.9,
                       workRegion: 'San Francisco, CA',
                       priceStart: 180.0,
                             ),
                           ),
                         );
                       },
                     ),
                     DoctorCard(
                       imagePath: 'assets/images/worker4.jpg',
                       name: 'Mr. Michael Robert',
                       specialty: 'Insect control worker',
                       experience: '12 years',
                       qualification: '',
                       rating: 4.6,
                       workRegion: 'London, UK',
                       priceStart: 250.0,
                       onTap: () {
                         Navigator.push(
                           context,
                           MaterialPageRoute(
                             builder: (context) => DoctorProfile(
                              imagePath: 'assets/images/worker4.jpg',
                       name: 'Mr. Michael Robert',
                       specialty: 'Insect control worker',
                       experience: '12 years',
                       qualification: '',
                       rating: 4.6,
                       workRegion: 'London, UK',
                       priceStart: 250.0,
                             ),
                           ),
                         );
                       },
                     ),
                   ],
                 ),
               ),

SizedBox(height: 20),
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Row(
      children: [
        Text(
          'All Workers',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    ),
    IconButton(
      icon: Icon(Icons.sort_outlined, color: Colors.blue), // Sort icon
      onPressed: () {
        // Implement sorting logic here
        // Call your sorting function
      },
    ),
  ],
),

SizedBox(height: 10),
Column(
  children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: DoctorCard(
            imagePath: 'assets/images/worker5.jpg',
            name: 'Mr. Tom Walker',
            specialty: 'Plumbing Works',
            experience: '20 years',
            qualification: 'Plumping Diploma',
            rating: 4.9,
            workRegion: 'New York, NY',
            priceStart: 150.0,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DoctorProfile(
                     imagePath: 'assets/images/worker5.jpg',
            name: 'Mr. Tom Walker',
            specialty: 'Plumbing Works',
            experience: '20 years',
            qualification: 'Plumping Diploma',
            rating: 4.9,
            workRegion: 'New York, NY',
            priceStart: 150.0,
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(width: 20), // Space between the two doctor cards
        Expanded(
          child: DoctorCard(
            imagePath: 'assets/images/worker9.jpg',
            name: 'Mr. Andy Martin',
            specialty: 'Factory Worker',
            experience: '17 years',
            qualification: 'Manufacturing Diploma',
            rating: 4.7,
            workRegion: 'Los Angeles, CA',
            priceStart: 180.0,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DoctorProfile(
                    imagePath: 'assets/images/worker9.jpg',
            name: 'Mr. Andy Martin',
            specialty: 'Factory Worker',
            experience: '17 years',
            qualification: 'Manufacturing Diploma',
            rating: 4.7,
            workRegion: 'Los Angeles, CA',
            priceStart: 180.0,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ),
    SizedBox(height: 20), // Space between rows
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: DoctorCard(
           imagePath: 'assets/images/worker6.jpg',
      name: 'Mr. Ahmed Gamal',
      specialty: 'Wood Works',
      experience: '15 years',
      qualification: 'Wood Works Diploma',
      rating: 4.7,
      workRegion: 'Cairo, Egypt',
      priceStart: 200.0,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DoctorProfile(
                   imagePath: 'assets/images/worker6.jpg',
      name: 'Mr. Ahmed Gamal',
      specialty: 'Wood Works',
      experience: '15 years',
      qualification: 'Wood Works Diploma',
      rating: 4.7,
      workRegion: 'Cairo, Egypt',
      priceStart: 200.0,
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(width: 20), // Space between the two doctor cards
        Expanded(
          child: DoctorCard(
          imagePath: 'assets/images/worker4.jpg',
      name: 'Mr. Michael Robert',
      specialty: 'Insect control worker',
      experience: '12 years',
      qualification: '',
      rating: 4.6,
      workRegion: 'London, UK',
      priceStart: 250.0,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DoctorProfile(
                  imagePath: 'assets/images/worker4.jpg',
      name: 'Mr. Michael Robert',
      specialty: 'Insect control worker',
      experience: '12 years',
      qualification: '',
      rating: 4.6,
      workRegion: 'London, UK',
      priceStart: 250.0,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ),
    SizedBox(height: 20), // Space between rows
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: DoctorCard(
            imagePath: 'assets/images/Worker/worker8.jpg',
      name: 'Mr. Edward Weston',
      specialty: 'Garden Works',
      experience: '8 years',
      qualification: 'Gardens Care Diploma',
      rating: 4.9,
      workRegion: 'San Francisco, CA',
      priceStart: 180.0,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DoctorProfile(
                    imagePath: 'assets/images/Worker/worker8.jpg',
      name: 'Mr. Edward Weston',
      specialty: 'Garden Works',
      experience: '8 years',
      qualification: 'Gardens Care Diploma',
      rating: 4.9,
      workRegion: 'San Francisco, CA',
      priceStart: 180.0,
                  ),
                ),
              );
            },
          ),
        ),
        // Add an empty expanded widget to balance the layout if the last row has only one doctor
        Expanded(child: SizedBox()), // Empty space for even alignment
      ],
    ),
  ],
),

SizedBox(height: 10),
 ],
          ),
        ),
      ),
      
    );
  }
}
class DoctorCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String specialty;
  final String experience;
  final String qualification;
  final double rating;
  final String workRegion;
  final double priceStart;

  DoctorCard({
    required this.imagePath,
    required this.name,
    required this.specialty,
    required this.experience,
    required this.qualification,
    required this.rating,
    required this.workRegion,
    required this.priceStart, required Null Function() onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the DoctorProfile screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DoctorProfile(
              name: name,
              specialty: specialty,
              experience: experience,
              qualification: qualification,
              rating: rating,
              workRegion: workRegion,
              priceStart: priceStart,
              imagePath: imagePath,
            ),
          ),
        );
      },
      child: Container(
        width: 161, // Adjusted width for better layout
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blueAccent, width: 2), // Colored border
          borderRadius: BorderRadius.circular(15), // Rounded corners
          gradient: LinearGradient(
            colors: [Colors.white, Colors.blue[50]!], // Background gradient
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 3), // Shadow effect
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imagePath,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue[800],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Icon(Icons.star, size: 16, color: Colors.yellow[700]),
                SizedBox(width: 4),
                Text(rating.toString(), style: TextStyle(fontSize: 14, color: Colors.grey)),
              ],
            ),
            SizedBox(height: 5),
            Text(
              specialty,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Icon(Icons.location_on, size: 16, color: Colors.blue),
                SizedBox(width: 4),
                Text(workRegion, style: TextStyle(fontSize: 14, color: Colors.grey)),
              ],
            ),
            SizedBox(height: 5),
            Text(
              '\$${priceStart.toString()} Start',
              style: TextStyle(color: Colors.greenAccent[400], fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class DoctorProfile extends StatelessWidget {
  final String name;
  final String specialty;
  final String experience;
  final String qualification;
  final double rating;
  final String workRegion;
  final double priceStart;
  final String imagePath;

  DoctorProfile({
    required this.name,
    required this.specialty,
    required this.experience,
    required this.qualification,
    required this.rating,
    required this.workRegion,
    required this.priceStart,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Color(0xFF00AEEF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imagePath,
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              specialty,
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 10),
            Text(
              'Experience: $experience',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Rating: $rating ⭐',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Region: $workRegion',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Price from: \$$priceStart',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              "Bio or additional details about the doctor would go here. You can include doctor's experience, qualifications, etc.",
              style: TextStyle(fontSize: 16),
            ),
 Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                children: [
                     Divider(),
                  ReviewItem(
                    name: 'Sofian Moaz',
                    profilePic: 'assets/images/profile.jpg', // Replace with your image path
                    reviewDate: '4 May 2024',
                    reviewText: 'غالى شوية بس شغله نضيف اوى وسريع ',
                    rating: 4,
                  ),
                  Divider(),
                  ReviewItem(
                    name: 'Kerollos Gamil',
                    profilePic: 'assets/images/profile.jpg', // Replace with your image path
                    reviewDate: '3 February 2024',
                    reviewText: 'الراجل شغله 10 من 10',
                    rating: 5,
                  ),
                  Divider(),
                ],
              ),
            ),Expanded(
  child: Align(
    alignment: Alignment.bottomCenter, // Align the button at the bottom
    child: ElevatedButton(
      onPressed: () {
        // Show confirmation dialog
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Order Confirmation'),
            content: Text('Are you sure you want to order Dr. $name?'),
            actions: [
              TextButton(
                onPressed: () {
                  // Close the dialog first
                  Navigator.of(context).pop();
                  
                  // Navigate to the ordering page
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => OrderingPage(doctorName: name), // Pass the doctor's name
                    ),
                  );
                },
                child: Text('Yes'),
                style: TextButton.styleFrom(
                  foregroundColor: Color(0xFF00AEEF), // Text color for the button
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text('No'),
              ),
            ],
          ),
        );
      },
      child: Text('Order Now'),
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF00AEEF), // Button color
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        textStyle: TextStyle(fontSize: 18),
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

