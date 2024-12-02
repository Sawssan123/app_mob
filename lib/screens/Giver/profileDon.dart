import 'package:flutter/material.dart';
import 'package:donation_app/screens/Giver/EditProfileD.dart';

class profileDon extends StatelessWidget {
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
          'My Profile',
          style: TextStyle(color: Colors.brown),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.edit, color: Colors.brown),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditProfileD()),
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
              child: Icon(Icons.person,
                  size: 50), // Placeholder for profile picture
            ),
            SizedBox(height: 10),
            Text(
              'Sandra Awiiri',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              '+256 704688781',
              style: TextStyle(color: Colors.grey[600]),
            ),
            SizedBox(height: 20),
            ProfileInfo(icon: Icons.email, text: 'anna.alvaddo@gmail.com'),
            ProfileInfo(
                icon: Icons.phone,
                text: '+256 704688781'), // Phone Number field
            ProfileInfo(
                icon: Icons.location_city,
                text: 'Najjera1, Kampala, Uganda'), // Location field
            ProfileInfo(
                icon: Icons.home,
                text: 'Additional Address Here'), // Additional Address field
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Donation button action
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
