import 'package:flutter/material.dart';
import 'package:donation_app/screens/Giver/Vetrine_Giver.dart'; // Assurez-vous que ce chemin est correct.

class ThankYouScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Logic to go back to the previous screen
            Navigator.pop(context);
          },
        ),
        title: Text('Thank You'),
        centerTitle: true,
        backgroundColor: Colors.pink[50], // Light pink background color
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Success checkmark icon
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.green[100],
                child: Icon(
                  Icons.check_circle_outline,
                  size: 50,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 20),
              // Thank you message
              Text(
                'Thank you for your generous',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.purple,
                ),
              ),
              RichText(
                text: TextSpan(
                  text: 'DONATION',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  children: [
                    WidgetSpan(
                      child: SizedBox(width: 10),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Thumbs up emoji (or any image/graphic)
              Image.asset(
                'assets/thumbs-up.png', // Replace with your own image or emoji
                height: 80,
              ),
              SizedBox(height: 20),
              // Home button
              ElevatedButton(
                onPressed: () {
                  // Navigate to the Vetrine_Giver screen
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => VetrineGiverScreen()),
                  );
                },
                child: Text('Go to Home'),
                style: ElevatedButton.styleFrom(
                  // Button color
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
