import 'package:donation_app/screens/Giver/verify_nbr_G.dart';
import 'package:flutter/material.dart';
import 'dart:math'; // For generating verification code

// Screen to verify the entered code
import 'Association/verify_nbr_A.dart';

class PhoneNumberScreen extends StatefulWidget {
  @override
  _PhoneNumberScreenState createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  String _selectedOption = "";
  TextEditingController _phoneController = TextEditingController();
  bool _isSending = false;
  String? _apiResponse;

  Future<void> _sendVerificationCode(String phoneNumber) async {
    // Check if the user has selected an option
    if (_selectedOption.isEmpty) {
      setState(() {
        _apiResponse = "Please select an option (Association or Giver).";
      });
      return;
    }

    setState(() {
      _isSending = true;
    });

    try {
      // Simulate an API call delay
      await Future.delayed(Duration(seconds: 2));

      // Fake response: Always success
      final verificationCode = _generateVerificationCode();
      print('Verification Code Sent: $verificationCode'); // Debug log
      setState(() {
        _apiResponse = "Verification code sent!";
      });

      // Navigate to the appropriate screen based on the selected option
      if (_selectedOption == "Association") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => VerifyNumber_AScreen(
              phoneNumber: phoneNumber,
              verificationCode: verificationCode,
            ),
          ),
        );
      } else if (_selectedOption == "Giver") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => VerifyNumber_GScreen(
              phoneNumber: phoneNumber,
              verificationCode: verificationCode,
            ),
          ),
        );
      }
    } catch (e) {
      setState(() {
        _apiResponse = "Error occurred while sending the code: $e";
      });
    } finally {
      setState(() {
        _isSending = false;
      });
    }
  }

  String _generateVerificationCode() {
    final random = Random();
    return (random.nextInt(900000) + 100000).toString(); // 6-digit code
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Logo
            Center(
              child: CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('assets/logo.png'), // Add your logo
                backgroundColor: Colors.transparent,
              ),
            ),
            SizedBox(height: 20.0),

            // "Sign up" text
            Text(
              'Sign up',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.brown[600],
              ),
            ),
            SizedBox(height: 20.0),

            // Input fields and radio buttons
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10.0,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Phone number input
                  TextField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Phone number',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/tunisia_flag_icon.png', // Path to Tunisia flag
                          width: 24,
                          height: 24,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),

                  // Radio buttons
                  Column(
                    children: [
                      ListTile(
                        title: Text('Association'),
                        leading: Radio<String>(
                          value: 'Association',
                          groupValue: _selectedOption,
                          onChanged: (String? value) {
                            setState(() {
                              _selectedOption = value!;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: Text('Giver'),
                        leading: Radio<String>(
                          value: 'Giver',
                          groupValue: _selectedOption,
                          onChanged: (String? value) {
                            setState(() {
                              _selectedOption = value!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),

                  // Submit button
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        backgroundColor: Colors.brown,
                        padding: EdgeInsets.all(16.0),
                      ),
                      onPressed: () {
                        if (_phoneController.text.isNotEmpty && !_isSending) {
                          _sendVerificationCode(_phoneController.text);
                        }
                      },
                      child: _isSending
                          ? CircularProgressIndicator(color: Colors.white)
                          : Icon(Icons.arrow_forward, color: Colors.white),
                    ),
                  ),

                  // Display API response message
                  if (_apiResponse != null)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        _apiResponse!,
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
