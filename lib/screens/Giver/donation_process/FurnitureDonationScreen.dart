import 'package:flutter/material.dart';
import 'package:donation_app/screens/Giver/donation_process/DonationForm.dart'; // Import the new ClothingDonationScreen

class FurnitureDonationScreen extends StatefulWidget {
  @override
  _FurnitureDonationScreenState createState() =>
      _FurnitureDonationScreenState();
}

class _FurnitureDonationScreenState extends State<FurnitureDonationScreen> {
  // State for tracking which furniture items are selected
  Map<String, bool> furnitureItems = {
    'Table': false,
    'Chair': false,
    'Sofa': false,
    'Bed': false,
    'Cupboard': false,
    'Desk': false,
    'Wardrobe': false,
    'Shelf': false,
    'Other': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Furniture Donation'),
        centerTitle: true,
        backgroundColor: Colors.pink[200],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top banner image (you can replace this with a network or asset image)
            Container(
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/banner.jpeg'), // Replace with your furniture image path
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Furniture Item',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: furnitureItems.keys.map((String key) {
                  return CheckboxListTile(
                    title: Text(key),
                    value: furnitureItems[key],
                    activeColor: Colors.pink,
                    onChanged: (bool? value) {
                      setState(() {
                        furnitureItems[key] = value ?? false;
                      });
                    },
                  );
                }).toList(),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Logic when pressing "Submit"
                final selectedItems = furnitureItems.entries
                    .where((entry) => entry.value)
                    .map((entry) => entry.key)
                    .toList();
                print('Selected items: $selectedItems');

                // Navigate to CreatePostScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DonationForm(),
                  ),
                );
              },
              child: Text('Submit'),
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
