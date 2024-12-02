import 'package:flutter/material.dart';
import 'package:donation_app/screens/Giver/donation_process/DonationForm.dart'; // Import the new ClothingDonationScreen

class ClothingDonationScreen extends StatefulWidget {
  @override
  _ClothingDonationScreenState createState() => _ClothingDonationScreenState();
}

class _ClothingDonationScreenState extends State<ClothingDonationScreen> {
  // State for tracking which items are selected
  Map<String, bool> clothingItems = {
    'Pants': false,
    'Shirt': false,
    'Shoes': false,
    'Coat': false,
    'Socks': false,
    'Dress': false,
    'T-shirt': false,
    'Shorts': false,
    'Other': false,
  };

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top banner image
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
            Text(
              'Clothing Item',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: clothingItems.keys.map((String key) {
                  return CheckboxListTile(
                    title: Text(key),
                    value: clothingItems[key],
                    activeColor: Colors.pink,
                    onChanged: (bool? value) {
                      setState(() {
                        clothingItems[key] = value ?? false;
                      });
                    },
                  );
                }).toList(),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Logic when pressing "Submit"
                final selectedItems = clothingItems.entries
                    .where((entry) => entry.value)
                    .map((entry) => entry.key)
                    .toList();

                // Print selected items (or handle it in other logic)
                print('Selected items: $selectedItems');

                // Navigate to DonationForm screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DonationForm()),
                );
              },
              child: Text('Next'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
