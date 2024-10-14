import 'package:flutter/material.dart';
import 'package:service_link/view/screens/main_screen.dart';
import 'package:service_link/view/screens/main_screens/OrderingPage.dart';


class TeacherPage extends StatelessWidget {
  const TeacherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF00AEEF),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MainScreen()),
            );
          },
        ),
        title: const Text(
          'Teachers',
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
                  contentPadding: const EdgeInsets.all(10),
                  hintText: 'Search Teachers...',
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(7),
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
                    const SizedBox(width: 16),
                    const Column(
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
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recommended',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                height: 300,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    DoctorCard(
                      imagePath: 'assets/images/Teacher/teacher_math.jpg',
                      name: 'Mr. Mark Alonso',
                      specialty: 'Math',
                      experience: '10 years',
                      qualification: 'MD, Faculty of Science',
                      rating: 4.8,
                      workRegion: 'New York, NY',
                      priceStart: 150.0,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DoctorProfile(
                imagePath: 'assets/images/Teacher/teacher_math.jpg',
                      name: 'Mr. Mark Alonso',
                      specialty: 'Math',
                      experience: '10 years',
                      qualification: 'MD, Faculty of Science',
                      rating: 4.8,
                      workRegion: 'New York, NY',
                      priceStart: 150.0,
                            ),
                          ),
                        );
                      },
                    ),
                    DoctorCard(
                      imagePath: 'assets/images/Teacher/teacher3.jpg',
                      name: 'Mr. Ahmed Gamal',
                      specialty: 'Arabic',
                      experience: '15 years',
                      qualification: 'MB, Faculty of Arts',
                      rating: 4.7,
                      workRegion: 'Cairo, Egypt',
                      priceStart: 200.0,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DoctorProfile(
                imagePath: 'assets/images/Teacher/teacher3.jpg',
                      name: 'Mr. Ahmed Gamal',
                      specialty: 'Arabic',
                      experience: '15 years',
                      qualification: 'MB, Faculty of Arts',
                      rating: 4.7,
                      workRegion: 'Cairo, Egypt',
                      priceStart: 200.0,
                            ),
                          ),
                        );
                      },
                    ),
                    DoctorCard(
                      imagePath: 'assets/images/Teacher/teacher5.jpg',
                      name: 'Mrs. Sarah Lee',
                      specialty: 'Science',
                      experience: '8 years',
                      qualification: 'MD, Faculty of Science',
                      rating: 4.9,
                      workRegion: 'San Francisco, CA',
                      priceStart: 180.0,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DoctorProfile(
                             imagePath: 'assets/images/Teacher/teacher5.jpg',
                      name: 'Mrs. Sarah Lee',
                      specialty: 'Science',
                      experience: '8 years',
                      qualification: 'MD, Faculty of Science',
                      rating: 4.9,
                      workRegion: 'San Francisco, CA',
                      priceStart: 180.0,
                            ),
                          ),
                        );
                      },
                    ),
                    DoctorCard(
                      imagePath: 'assets/images/Teacher/teacher2.jpg',
                      name: 'Mr. Michael Robert',
                      specialty: 'Physics',
                      experience: '12 years',
                      qualification: 'MD, Physics',
                      rating: 4.6,
                      workRegion: 'London, UK',
                      priceStart: 250.0,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DoctorProfile(
                             imagePath: 'assets/images/Teacher/teacher2.jpg',
                      name: 'Mr. Michael Robert',
                      specialty: 'Physics',
                      experience: '12 years',
                      qualification: 'MD, Physics',
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

const SizedBox(height: 20),
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    const Row(
      children: [
        Text(
          'All Teachers',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    ),
    IconButton(
      icon: const Icon(Icons.sort_outlined, color: Colors.blue), // Sort icon
      onPressed: () {
        // Implement sorting logic here
        // Call your sorting function
      },
    ),
  ],
),

const SizedBox(height: 10),
Column(
  children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: DoctorCard(
            imagePath: 'assets/images/Teacher/teacher2.jpg',
      name: 'Mr. Michael Robert',
      specialty: 'Physics',
      experience: '12 years',
      qualification: 'MD, Physics',
      rating: 4.6,
      workRegion: 'London, UK',
      priceStart: 250.0,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DoctorProfile(
                    imagePath: 'assets/images/Teacher/teacher2.jpg',
      name: 'Mr. Michael Robert',
      specialty: 'Physics',
      experience: '12 years',
      qualification: 'MD, Physics',
      rating: 4.6,
      workRegion: 'London, UK',
      priceStart: 250.0,
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(width: 20), // Space between the two doctor cards
        Expanded(
          child: DoctorCard(
            imagePath: 'assets/images/Teacher/Teacher1.jpg',
            name: 'Ms. Martin Matheo',
            specialty: 'biolegy',
            experience: '17 years',
            qualification: 'MD, biolegy',
            rating: 4.7,
            workRegion: 'Los Angeles, CA',
            priceStart: 180.0,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DoctorProfile(
                    imagePath: 'assets/images/Teacher/Teacher1.jpg',
            name: 'Ms. Martin Matheo',
            specialty: 'biolegy',
            experience: '17 years',
            qualification: 'MD, biolegy',
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
    const SizedBox(height: 20), // Space between rows
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: DoctorCard(
            imagePath: 'assets/images/Teacher/teacher_ph.jpg',
            name: 'Mr. John Clark',
            specialty: 'Physics',
            experience: '9 years',
            qualification: 'MD, Engneer',
            rating: 4.8,
            workRegion: 'Chicago, IL',
            priceStart: 200.0,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DoctorProfile(
                    imagePath: 'assets/images/Teacher/teacher_ph.jpg',
            name: 'Mr. John Clark',
            specialty: 'Physics',
            experience: '9 years',
            qualification: 'MD, Engneer',
            rating: 4.8,
            workRegion: 'Chicago, IL',
            priceStart: 200.0,
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(width: 20), // Space between the two doctor cards
        Expanded(
          child: DoctorCard(
            imagePath: 'assets/images/Teacher/teacher3.jpg',
      name: 'Mr. Ahmed Gamal',
      specialty: 'Arabic',
      experience: '15 years',
      qualification: 'MB, Faculty of Arts',
      rating: 4.7,
      workRegion: 'Cairo, Egypt',
      priceStart: 200.0,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DoctorProfile(
                    imagePath: 'assets/images/Teacher/teacher3.jpg',
      name: 'Mr. Ahmed Gamal',
      specialty: 'Arabic',
      experience: '15 years',
      qualification: 'MB, Faculty of Arts',
      rating: 4.7,
      workRegion: 'Cairo, Egypt',
      priceStart: 200.0,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ),
    const SizedBox(height: 20), // Space between rows
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: DoctorCard(
            imagePath: 'assets/images/Teacher/teacher5.jpg',
      name: 'Mrs. Sarah Lee',
      specialty: 'Science',
      experience: '8 years',
      qualification: 'MD, Faculty of Science',
      rating: 4.9,
      workRegion: 'San Francisco, CA',
      priceStart: 180.0,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DoctorProfile(
                    imagePath: 'assets/images/Teacher/teacher5.jpg',
      name: 'Mrs. Sarah Lee',
      specialty: 'Science',
      experience: '8 years',
      qualification: 'MD, Faculty of Science',
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
        const Expanded(child: SizedBox()), // Empty space for even alignment
      ],
    ),
  ],
),

const SizedBox(height: 10),
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

  const DoctorCard({super.key, 
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
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(10),
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
              offset: const Offset(0, 3), // Shadow effect
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
            const SizedBox(height: 10),
            Text(
              name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue[800],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Icon(Icons.star, size: 16, color: Colors.yellow[700]),
                const SizedBox(width: 4),
                Text(rating.toString(), style: const TextStyle(fontSize: 14, color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              specialty,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const Icon(Icons.location_on, size: 16, color: Colors.blue),
                const SizedBox(width: 4),
                Text(workRegion, style: const TextStyle(fontSize: 14, color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 5),
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

  const DoctorProfile({super.key, 
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
        backgroundColor: const Color(0xFF00AEEF),
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
            const SizedBox(height: 20),
            Text(
              name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              specialty,
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 10),
            Text(
              'Experience: $experience',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'Rating: $rating ⭐',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'Region: $workRegion',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'Price from: \$$priceStart',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              "Bio or additional details about the doctor would go here. You can include doctor's experience, qualifications, etc.",
              style: TextStyle(fontSize: 16),
            ),
            const Spacer(), // Push the button to the bottom of the screen
Expanded(
  child: Align(
    alignment: Alignment.bottomCenter, // Align the button at the bottom
    child: ElevatedButton(
      onPressed: () {
        // Show confirmation dialog
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Order Confirmation'),
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
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFF00AEEF), // Text color for the button
                ),
                child: Text('Yes'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('No'),
              ),
            ],
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF00AEEF), // Button color
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        textStyle: const TextStyle(fontSize: 18),
      ),
      child: Text('Order Now'),
    ),
  ),
),

          ],
        ),
      ),
    );
  }
}
