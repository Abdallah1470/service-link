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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Select your category', style: TextStyle(fontSize: 18)),
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
                validator: (value) => value == null ? 'Please select a category' : null,
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
      await ref.read(userViewModelProvider.notifier).becomeWorker(_selectedCategory!);
      // Navigate back or show a success message
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Successfully became a worker'),
      ));
      Navigator.pop(context); // Navigate back after success
    }
  }
}
