import 'package:flutter/material.dart';

class ListeFamilies extends StatelessWidget {
  final List<Family> families = [
    Family(
      name: "Family1234",
      address: "22 Sunshine St, Familytown",
      phone: "+123-456-7890",
      description: "Single-parent household with 2 children. In need of school supplies and clothes for winter.",
      imageUrl: "https://via.placeholder.com/150",
    ),
    Family(
      name: "Anonymous567",
      address: "Association Contact",
      phone: "+123-555-1212",
      description: "Elderly couple with limited income. Requires assistance with food and basic healthcare supplies.",
      imageUrl: "https://via.placeholder.com/150",
    ),
    Family(
      name: "Family789045",
      address: "Charity Ave, Helpville",
      phone: "+987-654-3210",
      description: "Family of 5, including a newborn. In need of baby clothes, diapers, and formula.",
      imageUrl: "https://via.placeholder.com/150",
    ),
    Family(
      name: "Anonymous890167",
      address: "Social Worker Contact",
      phone: "+321-123-4567",
      description: "Homeless family staying at a shelter. In urgent need of warm clothes and bedding for winter.",
      imageUrl: "https://via.placeholder.com/150",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F4F4),
      appBar: AppBar(
        title: Center(
          child: Text(
            'List of Families',
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.grey[100],
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: families.length,
        itemBuilder: (context, index) {
          return FamilyCard(family: families[index]);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Action for adding a family
        },
        label: Text("Add Family", style: TextStyle(color: Colors.white)),
        icon: Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.brown,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class Family {
  final String name;
  final String address;
  final String phone;
  final String description;
  final String imageUrl;

  Family({
    required this.name,
    required this.address,
    required this.phone,
    required this.description,
    required this.imageUrl,
  });
}

class FamilyCard extends StatelessWidget {
  final Family family;

  FamilyCard({required this.family});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(family.imageUrl),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    family.name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(family.address),
                  Text(family.phone),
                  SizedBox(height: 6),
                  Text(
                    family.description,
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                // Action to remove this family
              },
            ),
          ],
        ),
      ),
    );
  }
}
