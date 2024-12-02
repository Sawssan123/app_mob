import 'package:flutter/material.dart';
import 'package:donation_app/screens/Giver/donation_process/ClothingCategoryScreen.dart'; // Import the ClothingDonationScreen
import 'package:donation_app/screens/Giver/donation_process/FurnitureDonationScreen.dart';
import 'package:donation_app/screens/Giver/donation_process/DonationForm.dart';

class DonationTypeSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Don Type Selection'),
        centerTitle: true,
        backgroundColor: Colors.grey[200],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Top banner image (you can replace this with a network or asset image)
            Container(
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/banner.jpeg'), // Replace with your image path
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                children: [
                  // Clothing button
                  buildDonationCard(context, 'Clothing', 'assets/Clothing.png',
                      Colors.purple),
                  // Furniture button
                  buildDonationCard(context, 'Furniture',
                      'assets/furniture.png', Colors.brown),
                  // Books button
                  buildDonationCard(
                      context, 'Books', 'assets/Books.png', Colors.red),
                  // Other button
                  buildDonationCard(
                      context, 'Other', 'assets/others.png', Colors.orange),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget for each donation card
  Widget buildDonationCard(
      BuildContext context, String title, String imagePath, Color color) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 5,
      child: InkWell(
        onTap: () {
          // Navigate to ClothingDonationScreen if "Clothing" is tapped
          if (title == 'Clothing') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ClothingCategoryScreen()),
            );
          } else if (title == 'Furniture') {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      FurnitureDonationScreen()), // Navigate to FurnitureDonationScreen
            );
          } else if (title == 'Books') {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      DonationForm()), // Navigate to BooksDonationScreen
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      DonationForm()), // Navigate to BooksDonationScreen
            );
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, height: 60),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
