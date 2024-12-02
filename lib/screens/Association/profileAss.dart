import 'package:flutter/material.dart';
import 'package:donation_app/screens/Association/EditProfileA.dart';

class profileAss extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.brown),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Association Profile',
          style: TextStyle(color: Colors.brown),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.edit, color: Colors.brown),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditProfileA()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 50,
              child: Icon(Icons.apartment,
                  size: 50), // Placeholder for association picture
            ),
            SizedBox(height: 10),
            Text(
              'Association Name',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ProfileInfo(icon: Icons.email, text: 'association@example.com'),
            ProfileInfo(
                icon: Icons.phone,
                text: '+256 700000000'), // Phone Number field
            ProfileInfo(
                icon: Icons.location_city,
                text: 'Location, City, Country'), // Location field
            ProfileInfo(
                icon: Icons.description,
                text: 'Description of the association'), // Description field
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Association-specific action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                shape: CircleBorder(),
                padding: EdgeInsets.all(20),
              ),
              child: Icon(Icons.favorite, color: Colors.white),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class ProfileInfo extends StatelessWidget {
  final IconData icon;
  final String text;

  ProfileInfo({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.brown),
          SizedBox(width: 20),
          Text(
            text,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
