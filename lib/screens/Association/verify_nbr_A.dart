import 'package:donation_app/screens/Association/sign_up_A.dart';
import 'package:flutter/material.dart';

class VerifyNumber_AScreen extends StatelessWidget {
  final String phoneNumber;
  final String verificationCode;

  VerifyNumber_AScreen({
    required this.phoneNumber,
    required this.verificationCode,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // Light background color
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            CircleAvatar(
              radius: 50.0,
              backgroundColor: Colors.black,
              child: Icon(
                Icons.eco, // Replace this with your logo
                size: 50,
                color: Colors.greenAccent,
              ),
            ),
            SizedBox(height: 20.0),
            // "Verify" text
            Text(
              'Verify',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 40.0),
            // Input field for verification code
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10.0,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter verification code',
                          hintStyle: TextStyle(color: Colors.grey[400]),
                        ),
                      ),
                    ),
                    // Arrow button
                    ElevatedButton(
                      onPressed: () {
                        // Handle verification action
                      },
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        backgroundColor: Colors.brown, // Button color
                        padding: EdgeInsets.all(16.0),
                      ),
                      child: Icon(Icons.arrow_forward, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0),
            // Resend code text
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUpAScreen(),
                  ),
                );
              },
              child: Text(
                'Resend Code',
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
