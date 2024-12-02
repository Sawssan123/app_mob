import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SignUpGScreen extends StatefulWidget {
  @override
  _SignUpGScreenState createState() => _SignUpGScreenState();
}

class _SignUpGScreenState extends State<SignUpGScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  bool _isLoading = false; // State for loading
  String? _errorMessage; // State for error messages

  // API endpoint
  final String _baseUrl = "http://localhost:5000";

  Future<void> _signUp() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
        _errorMessage = null; // Reset error message
      });

      // Prepare data to send
      final data = {
        "fullname": _fullNameController.text,
        "email": _emailController.text,
        "dob": _dobController.text,
        "location": _locationController.text,
        "type": "giver", // Always "giver" for this screen
      };

      try {
        final response = await http.post(
          Uri.parse("$_baseUrl/users"), // Update the endpoint as needed
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(data),
        );

        if (response.statusCode == 201) {
          // Navigate or show success message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Sign up successful!")),
          );
          // Clear the fields after success
          _fullNameController.clear();
          _emailController.clear();
          _dobController.clear();
          _locationController.clear();
        } else {
          setState(() {
            _errorMessage = "Error: ${jsonDecode(response.body)['message']}";
          });
        }
      } catch (e) {
        setState(() {
          _errorMessage = "Failed to connect to server: $e";
        });
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDE8E4), // Background color
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Icon(Icons.eco, color: Colors.green, size: 50),
                ],
              ),
              SizedBox(height: 30),

              // Form card
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "TELL US ABOUT YOU",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.brown,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 20),

                      // Full name field
                      TextFormField(
                        controller: _fullNameController,
                        decoration: InputDecoration(
                          labelText: "Full Name",
                          prefixIcon: Icon(Icons.person),
                          border: UnderlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your full name";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),

                      // Email address field
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: "Email Address",
                          prefixIcon: Icon(Icons.email),
                          border: UnderlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your email";
                          }
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return "Please enter a valid email";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),

                      // Date of birth field
                      TextFormField(
                        controller: _dobController,
                        decoration: InputDecoration(
                          labelText: "Date of Birth",
                          prefixIcon: Icon(Icons.calendar_today),
                          border: UnderlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your date of birth";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),

                      // Location field
                      TextFormField(
                        controller: _locationController,
                        decoration: InputDecoration(
                          labelText: "Location",
                          prefixIcon: Icon(Icons.home),
                          border: UnderlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your location";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 30),

                      // Error message
                      if (_errorMessage != null)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            _errorMessage!,
                            style: TextStyle(color: Colors.red),
                          ),
                        ),

                      // Submit button
                      Center(
                        child: ElevatedButton(
                          onPressed: _isLoading ? null : _signUp,
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            backgroundColor: Colors.brown,
                            padding: EdgeInsets.all(20),
                          ),
                          child: _isLoading
                              ? CircularProgressIndicator(color: Colors.white)
                              : Icon(Icons.arrow_forward, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
