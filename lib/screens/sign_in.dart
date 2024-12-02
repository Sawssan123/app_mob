import 'package:donation_app/screens/Association/Vetrine_Asso.dart';
import 'package:donation_app/screens/Association/sign_up_A.dart';
import 'package:donation_app/screens/Giver/Vetrine_Giver.dart';
import 'package:donation_app/screens/phone_number.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Import the font awesome package

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your username';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  String? errorMessage;

  void login() {
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    if (_formKey.currentState!.validate()) {
      if (username == "sawsen" && password == "admin2024") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => VetrineAssoScreen(),
          ),
        );
      } else if (username == "douroub" && password == "donneur2024") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => VetrineGiverScreen(),
          ),
        );
      } else {
        setState(() {
          errorMessage = "User name or password invalid";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.grey[200],
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              // Sign-in card
              Positioned(
                top: 80,
                child: Container(
                  width: 300,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(height: 40),
                        Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        // Username input
                        TextFormField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                            prefixIcon:
                                Icon(Icons.person_outline, color: Colors.brown),
                            labelText: 'Username',
                            border: OutlineInputBorder(),
                          ),
                          validator: _validateUsername,
                        ),
                        SizedBox(height: 20),
                        // Password input
                        TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            prefixIcon:
                                Icon(Icons.lock_outline, color: Colors.brown),
                            labelText: 'Password',
                            border: OutlineInputBorder(),
                          ),
                          obscureText: true,
                          validator: _validatePassword,
                        ),
                        SizedBox(height: 30),
                        // Error message
                        if (errorMessage != null)
                          Text(
                            errorMessage!,
                            style: TextStyle(color: Colors.red),
                          ),
                        SizedBox(height: 10),
                        // Submit button
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.brown,
                          child: IconButton(
                            icon:
                                Icon(Icons.arrow_forward, color: Colors.white),
                            onPressed: login,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Circle icon at the top of the card
              Positioned(
                top: 40,
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.eco,
                    color: Colors.green[300],
                    size: 40,
                  ),
                ),
              ),
              // Social sign-in section
              Positioned(
                bottom: 50,
                child: Column(
                  children: [
                    Text(
                      'Or sign in with',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        socialLoginButton(
                            FontAwesomeIcons.google, Colors.red), // Google
                        SizedBox(width: 20),
                        socialLoginButton(
                            FontAwesomeIcons.facebook, Colors.blue), // Facebook
                        SizedBox(width: 20),
                        socialLoginButton(
                            FontAwesomeIcons.cloud, Colors.black), // iCloud
                      ],
                    ),
                    SizedBox(height: 20),
                    // Sign-up option
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PhoneNumberScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to build social login buttons
  Widget socialLoginButton(IconData icon, Color color) {
    return CircleAvatar(
      radius: 25,
      backgroundColor: Colors.white,
      child: Icon(
        icon,
        color: color,
        size: 30,
      ),
    );
  }
}
