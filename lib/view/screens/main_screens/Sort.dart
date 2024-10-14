import 'package:flutter/material.dart';

class Doctor {
  String name;
  double price;
  int experience; // Years of experience
  String workRegion;

  Doctor({required this.name, required this.price, required this.experience, required this.workRegion});
}

class DoctorListPage extends StatefulWidget {
  @override
  _DoctorListPageState createState() => _DoctorListPageState();
}

class _DoctorListPageState extends State<DoctorListPage> {
  List<Doctor> doctors = [
    Doctor(name: 'Dr. Smith', price: 100.0, experience: 5, workRegion: 'New York'),
    Doctor(name: 'Dr. Adams', price: 150.0, experience: 8, workRegion: 'Los Angeles'),
    Doctor(name: 'Dr. Brown', price: 120.0, experience: 3, workRegion: 'Chicago'),
    Doctor(name: 'Dr. Carter', price: 200.0, experience: 10, workRegion: 'Miami'),
  ];

  String selectedCriteria = 'price'; // Default sorting by price
  bool isAscending = true; // Default sorting order

  void _sortDoctors() {
    setState(() {
      if (selectedCriteria == 'price') {
        doctors.sort((a, b) => isAscending ? a.price.compareTo(b.price) : b.price.compareTo(a.price));
      } else if (selectedCriteria == 'experience') {
        doctors.sort((a, b) => isAscending ? a.experience.compareTo(b.experience) : b.experience.compareTo(a.experience));
      } else if (selectedCriteria == 'workRegion') {
        doctors.sort((a, b) => isAscending ? a.workRegion.compareTo(b.workRegion) : b.workRegion.compareTo(a.workRegion));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctors List'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (String value) {
              setState(() {
                selectedCriteria = value; // Set the selected criteria
                _sortDoctors(); // Sort the doctors when criteria changes
              });
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'price',
                child: Text('Sort by Price'),
              ),
              const PopupMenuItem<String>(
                value: 'experience',
                child: Text('Sort by Experience'),
              ),
              const PopupMenuItem<String>(
                value: 'workRegion',
                child: Text('Sort by Work Region'),
              ),
            ],
          ),
          IconButton(
            icon: Icon(isAscending ? Icons.arrow_upward : Icons.arrow_downward, color: Colors.blue),
            onPressed: () {
              setState(() {
                isAscending = !isAscending; // Toggle ascending/descending
                _sortDoctors(); // Call sorting logic
              });
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          final doctor = doctors[index];
          return ListTile(
            title: Text(doctor.name),
            subtitle: Text(
              'Price: \$${doctor.price}, Experience: ${doctor.experience} years, Region: ${doctor.workRegion}',
            ),
          );
        },
      ),
    );
  }
}
