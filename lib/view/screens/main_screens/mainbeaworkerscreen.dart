import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<MyApp> {
  // Controllers for text fields
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =TextEditingController();
  final TextEditingController _WatsappNumber = TextEditingController();
  final TextEditingController _work = TextEditingController();
  final TextEditingController _livesIn = TextEditingController();
  final TextEditingController _age = TextEditingController();
  final TextEditingController _experiance = TextEditingController();
  final TextEditingController _workArea = TextEditingController();
  final TextEditingController _descreption = TextEditingController();


  bool isMaleSelected = true;
  bool isTermsAccepted = false;

  final _formKey = GlobalKey<FormState>();

  // Function to handle form submission
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Collecting data
      String firstName = _firstNameController.text;
      String lastName = _lastNameController.text;
      String mobileNumber = _mobileNumberController.text;
      String watsappNumber = _WatsappNumber.text;
      String email = _emailController.text;
      String work = _work.text;
      String age = _age.text;
      String experiance = _experiance.text;
      String livesIn = _livesIn.text;
      String workArea = _workArea.text;
      String password = _passwordController.text;
      String gender = isMaleSelected ? 'Male' : 'Female';
      String descreption = _descreption.text;
      

      // For demonstration, we'll print the data in the console
      print('First Name: $firstName');
      print('Last Name: $lastName');
      print('Mobile Number: $mobileNumber');
      print('Mobile Number: $watsappNumber');
      print('Email: $email');
      print('Password: $password');
      print('Gender: $gender');

      // Proceed with other operations, such as sending the data to the backend.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Account created successfully!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Back button action
          },
        ),
        title: Text('Create a new worker account',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              // Skip button action
            },
            child: Text(
              'Skip',
              style: TextStyle(color: Colors.grey),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(height: 10),

              // Description
              Text(
                'Please complete your steps to create your account',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 20),

              // Profile Picture Placeholder
              Center(
                child: CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.grey[300],
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.grey[600],
                  ),
                ),
              ),
              SizedBox(height: 20),

              // First Name Field
              TextFormField(
                controller: _firstNameController,
                decoration: InputDecoration(
                  labelText: 'First name',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your first name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),

              // Last Name Field
              TextFormField(
                controller: _lastNameController,
                decoration: InputDecoration(
                  labelText: 'Last name',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your last name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),

              // ID number Field
              TextFormField(
                controller: _lastNameController,
                decoration: InputDecoration(
                  labelText: 'ID number',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your ID number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),

              // Lives in Field
              TextFormField(
                controller: _firstNameController,
                decoration: InputDecoration(
                  labelText: 'Lives in',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter you are Lives were ?';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),

              // Age Field
              TextFormField(
                controller: _firstNameController,
                decoration: InputDecoration(
                  labelText: 'your age',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your age';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),


              // Mobile Number Field with Country Code
              TextFormField(
                controller: _mobileNumberController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.network(
                          'https://upload.wikimedia.org/wikipedia/commons/f/fe/Flag_of_Egypt.svg',
                          width: 24,
                          height: 24,
                        ),
                        SizedBox(width: 8),
                        Text('+20'),
                      ],
                    ),
                  ),
                  labelText: 'Mobile Number',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your mobile number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),

              // Watsapp Number Field with Country Code
              TextFormField(
                controller: _WatsappNumber,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.network(
                          'https://upload.wikimedia.org/wikipedia/commons/f/fe/Flag_of_Egypt.svg',
                          width: 24,
                          height: 24,
                        ),
                        SizedBox(width: 8),
                        Text('+20'),
                      ],
                    ),
                  ),
                  labelText: 'Watsapp Number',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Watsapp number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),

              // Work Field
              TextFormField(
                controller: _firstNameController,
                decoration: InputDecoration(
                  labelText: 'Job titel',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your job titel';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),

              // Work area Field
              TextFormField(
                controller: _firstNameController,
                decoration: InputDecoration(
                  labelText: 'Work area',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Work area';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),

              // Experiance Field
              TextFormField(
                controller: _firstNameController,
                decoration: InputDecoration(
                  labelText: 'your experiance',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your experiance';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),


              // Email Field
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email address',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),

              // Password Field
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  suffixIcon: Icon(Icons.visibility),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),

            

              


              // Re-enter Password Field
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Re-enter your password',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  suffixIcon: Icon(Icons.visibility),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  } else if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              // Descreption Field
              TextFormField(
                controller: _firstNameController,
                decoration: InputDecoration(
                  labelText: 'More information about you',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(height: 20),


              // Gender Selection
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isMaleSelected = true;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isMaleSelected ? Colors.blue : Colors.grey[300],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Text(
                        'Male',
                        style: TextStyle(
                          color: isMaleSelected ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isMaleSelected = false;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: !isMaleSelected ? Colors.blue : Colors.grey[300],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Text(
                        'Female',
                        style: TextStyle(
                          color: !isMaleSelected ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Terms and Conditions Checkbox
              Row(
                children: [
                  Checkbox(
                    value: isTermsAccepted,
                    onChanged: (bool? value) {
                      setState(() {
                        isTermsAccepted = value!;
                      });
                    },
                  ),
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        text: 'I agree to the ',
                        children: [
                          TextSpan(
                            text: 'Terms and conditions',
                            style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          TextSpan(text: ' and '),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                      style: TextStyle(color: Colors.grey[800], fontSize: 14),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Submit Button
              ElevatedButton(
                onPressed: isTermsAccepted ? _submitForm : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Text('Create Account'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}
