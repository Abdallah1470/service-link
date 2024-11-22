/*
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../viewmodels/user_view_model.dart';

class BecomeWorkerScreen extends ConsumerStatefulWidget {
  const BecomeWorkerScreen({super.key});

  @override
  _BecomeWorkerScreenState createState() => _BecomeWorkerScreenState();
}

class _BecomeWorkerScreenState extends ConsumerState<BecomeWorkerScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedCategory;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _cityController = TextEditingController();
  final _category = TextEditingController();
  final _skills = TextEditingController();
  final _yearsOfExperience = TextEditingController();
  final _workingAreas = TextEditingController();
  final _description = TextEditingController();



  // List of predefined categories
  final List<String> categories = [
    'Electrician',
    'Plumber',
    'Carpenter',
    'Mechanic',
    'Painter',
    // Add more categories as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Become a Worker')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter your name' : null,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter your email' : null,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phone Number',
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter your phone number' : null,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _cityController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'City',
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter your city' : null,
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Category',
                ),
                value: _selectedCategory,
                items: categories.map((category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value;
                  });
                },
                validator: (value) =>
                    value == null ? 'Please select a category' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                child: Text('Become a Worker'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      // Call ViewModel to update the user's role
      await ref.read(userViewModelProvider.notifier).becomeWorker(
            FirebaseAuth.instance.currentUser!.uid,
            _selectedCategory!,
          );
      // Navigate back or show a success message
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Successfully became a worker'),
      ));
      Navigator.pop(context); // Navigate back after success
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _cityController.dispose();
    super.dispose();
  }
}*/

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:service_link/data/models/user_model.dart';
import '../../data/models/worker_model.dart';

class BecomeWorkerScreen extends StatefulWidget {
  @override
  _BecomeWorkerScreen createState() => _BecomeWorkerScreen();
}

class _BecomeWorkerScreen extends State<BecomeWorkerScreen> {
  final _formKey = GlobalKey<FormState>();
  String? selectedCategory;
  String description = '';
  List<String> selectedWorkingAreas = [];
  int yearsOfExperience = 0;
  List<WorkingArea> workingAreasEnum = WorkingArea.values;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Create the WorkerModel
      final worker = WorkerModel(
        user: /* Your UserModel instance */
        UserModel(
          id: '1',
          name: 'John Doe',
          email: '',
          phoneNumber: '',
          role: UserRole.worker,
          city: '',
          dateOfBirth: DateTime.now(),
          profileImageUrl: '',
          registrationDate: DateTime.now(),
        ),
        category: selectedCategory ?? '',
        description: description,
        yearsOfExperience: yearsOfExperience,
        workingAreas: selectedWorkingAreas,
      );

      // Handle the worker creation logic here (e.g., save to Firestore)
      print(worker.toJson());
    }
  }

  void _openWorkingAreasBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              padding: EdgeInsets.all(16),
              height: 400,
              child: Column(
                children: [
                  Text(
                    'Select Working Areas',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: ListView(
                      children: workingAreasEnum.map((area) {
                        return CheckboxListTile(
                          title: Text(area.toString().split('.').last),
                          value: selectedWorkingAreas.contains(area.toString().split('.').last),
                          onChanged: (bool? value) {
                            setState(() {
                              if (value == true) {
                                selectedWorkingAreas.add(area.toString().split('.').last);
                              } else {
                                selectedWorkingAreas.remove(area.toString().split('.').last);
                              }
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      setState(() {});
                    },
                    child: Text('Done'),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Become a Worker')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                value: selectedCategory,
                hint: Text('Select Category'),
                items: WorkerCategory.values.map((category) {
                  return DropdownMenuItem<String>(
                    value: category.toString().split('.').last,
                    child: Text(category.toString().split('.').last),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCategory = value;
                  });
                },
                validator: (value) => value == null ? 'Please select a category' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
                onSaved: (value) => description = value!,
                validator: (value) => value!.isEmpty ? 'Please enter a description' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(labelText: 'Years of Experience'),
                keyboardType: TextInputType.number,
                onSaved: (value) => yearsOfExperience = int.parse(value!),
                validator: (value) => value!.isEmpty ? 'Please enter your years of experience' : null,
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: _openWorkingAreasBottomSheet,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    selectedWorkingAreas.isEmpty
                        ? 'Select Working Areas'
                        : selectedWorkingAreas.join(', '),
                  ),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _submit,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum WorkerCategory {
  plumber,
  electrician,
  carpenter,
  painter,
  cleaner,
  mechanic,
  gardener,
  welder,
  chef,
  tutor,
  designer,
  developer,
  // Add more categories as needed
}

enum WorkingArea {
  cairo,
  alexandria,
  giza,
  luxor,
  aswan,
  ismailia,
  portsaid,
  dakahlia,
  sharqia,
  qalyubia,
  behaira,
  monufia,
  minya,
  beni_suef,
  fayoum,
  red_sea,
  suez,
  matrouh,
  north_sinai,
  south_sinai,
  damietta,
  new_valley,
  qena,
  sohag,
  assiut,
  // Add more governorates as needed
}
