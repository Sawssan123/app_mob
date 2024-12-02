import 'package:flutter/material.dart';
import 'package:donation_app/screens/Giver/donation_process/ClothingDonationScreen.dart'; // Import the new ClothingDonationScreen

class ClothingCategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clothing Donation'),
        centerTitle: true,
        backgroundColor: Colors.pink[200],
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
                  // Category: Women
                  buildCategoryCard(
                      context, 'Women', 'assets/women.png', Colors.purple),
                  // Category: Men
                  buildCategoryCard(
                      context, 'Men', 'assets/men.png', Colors.blue),
                  // Category: Girl
                  buildCategoryCard(
                      context, 'Girl', 'assets/girl.png', Colors.pink),
                  // Category: Boy
                  buildCategoryCard(
                      context, 'Boy', 'assets/boy.png', Colors.lightBlue),
                  // Category: Baby
                  buildCategoryCard(
                      context, 'Baby', 'assets/baby.png', Colors.orange),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget for each category card
  Widget buildCategoryCard(
      BuildContext context, String title, String imagePath, Color color) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 5,
      child: InkWell(
        onTap: () {
          // Navigate to ClothingDonationScreen when a category is tapped
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ClothingDonationScreen(),
            ),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Category Image
            Image.asset(imagePath, height: 60),
            SizedBox(height: 10),
            // Category Title
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
