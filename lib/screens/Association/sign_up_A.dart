import 'package:flutter/material.dart';

class SignUpAScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDE8E4), // Couleur d'arrière-plan
      body: Center(
        child: Padding(
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
                      decoration: InputDecoration(
                        labelText: "Full Name",
                        prefixIcon: Icon(Icons.person),
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),

                    // Email address field
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Email Address",
                        prefixIcon: Icon(Icons.email),
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),

                    // Date of birth field
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Date of Birth",
                        prefixIcon: Icon(Icons.calendar_today),
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),

                    // Location field
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Location",
                        prefixIcon: Icon(Icons.home),
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 30),

                    // Submit button
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle sign-up logic
                        },
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          backgroundColor: Colors.brown,
                          padding: EdgeInsets.all(20),
                        ),
                        child: Icon(Icons.arrow_forward, color: Colors.white),
                      ),
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
}
