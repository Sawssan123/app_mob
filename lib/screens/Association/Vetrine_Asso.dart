
import 'package:donation_app/screens/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:donation_app/screens/ProductDetailScreen.dart';

import 'package:donation_app/screens/EventForm.dart' as event_form;
import 'package:donation_app/screens/FamilyForm.dart' as family_form;

import 'dart:convert';
import 'package:http/http.dart' as http;


class VetrineAssoScreen extends StatefulWidget {
  @override
  _VetrineAssoScreenState createState() => _VetrineAssoScreenState();
}





class _VetrineAssoScreenState extends State<VetrineAssoScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;


// Fonction pour récupérer les familles
Future<List<Map<String, dynamic>>> fetchFamilies() async {
  final response = await http.get(Uri.parse('http://votre-serveur/families'));

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);
    return data.map((item) => item as Map<String, dynamic>).toList();
  } else {
    throw Exception('Failed to load families');
  }
}

// Fonction pour récupérer les événements
Future<List<Map<String, dynamic>>> fetchEvents() async {
  final response = await http.get(Uri.parse('http://votre-serveur/events'));

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);
    return data.map((item) => item as Map<String, dynamic>).toList();
  } else {
    throw Exception('Failed to load events');
  }
}



  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this); // 4 onglets définis
    _tabController.addListener(() {
      setState(() {}); // Met à jour l'interface lorsqu'on change d'onglet
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.brown),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => SignInScreen(),
              ),
            );
          },
        ),
        title: Text(
          'Donation',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.person, color: Colors.black),
            onPressed: () {
              // Naviguer vers le profil
            },
          ),
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {
              // Action de recherche
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.brown,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.brown,
          tabs: [
            Tab(text: 'Donation'),
            Tab(text: 'Association'),
            Tab(text: 'Families'),
            Tab(text: 'Events'),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Onglet "Donation" avec la grille de cartes
                Padding(
  padding: const EdgeInsets.all(8.0),
  child: GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      childAspectRatio: 0.7,
    ),
    itemCount: 9,
    itemBuilder: (context, index) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailScreen(),
            ),
          );
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (index == 0)
                Image.asset(
                  'assets/jacket.png',
                  height: 60,
                ),
              SizedBox(height: 8),
              Text(
                'Item $index',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Category',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      );
    },
  ),
),

                // Onglet "Association" - Liste des associations
                ListView.builder(
                  padding: EdgeInsets.all(8.0),
                  itemCount: associations.length,
                  itemBuilder: (context, index) {
                    final association = associations[index];
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 2,
                      child: ListTile(
                        contentPadding: EdgeInsets.all(16.0),
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              AssetImage(association['logo'] as String),
                        ),
                        title: Text(
                          association['name'] as String,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.brown,
                          ),
                        ),
                        subtitle: Text(
                          association['description'] as String,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing:
                            Icon(Icons.arrow_forward, color: Colors.brown),
                        onTap: () {
                          // Naviguer vers les détails de l'association
                        },
                      ),
                    );
                  },
                ),
// Onglet "Families" - Liste des familles
                ListView.builder(
                  padding: EdgeInsets.all(8.0),
                  itemCount: families.length,
                  itemBuilder: (context, index) {
                    final family = families[index];
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Affichage de l'image en haut de la carte
                          ClipRRect(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(16)),
                            child: Image.asset(
                              family['logo'] ??
                                  'assets/default_image.png', // Default image
                              width: double.infinity,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                          // Contenu textuel en dessous de l'image
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  family['name'] ??
                                      'Unknown Family', // Handle null name
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.brown,
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  family['description'] ??
                                      'No description available.', // Handle null description
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Address: ${family['address'] ?? 'Not provided'}', // Handle null address
                                  style: TextStyle(fontSize: 14),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Needs: ${family['needs'] ?? 'Not specified'}', // Handle null needs
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                // Onglet "Events" - Liste des événements
                ListView.builder(
                  padding: EdgeInsets.all(8.0),
                  itemCount: events.length,
                  itemBuilder: (context, index) {
                    final event = events[index];
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Affichage de l'image en haut de la carte
                          ClipRRect(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(16)),
                            child: Image.asset(
                              event['image'] as String,
                              width: double.infinity,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                          // Contenu textuel en dessous de l'image
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  event['title'] as String,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.brown,
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  event['date'] as String,
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 14),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  event['description'] as String,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          // Boutons contextuels
          // Boutons contextuels
            // Boutons contextuels
if (_tabController.index == 2) // Onglet "Families"
  Padding(
    padding: const EdgeInsets.all(16.0),
    child: ElevatedButton(
      onPressed: () {
        // Naviguer vers FamilyForm
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => family_form.FamilyForm()),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.brown[300],
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(
        "Add New Family",
        style: TextStyle(fontSize: 16),
      ),
    ),
  ),
if (_tabController.index == 3) // Onglet "Events"
  Padding(
    padding: const EdgeInsets.all(16.0),
    child: ElevatedButton(
      onPressed: () {
        // Naviguer vers EventForm
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => event_form.EventForm()),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.brown[300],
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(
        "Create New Event",
        style: TextStyle(fontSize: 16),
      ),
    ),
  ),

        ],
      ),
    );
  }
}

// Exemple de données des associations
final List<Map<String, String>> associations = [
  {
    'name': 'Maram Association',
    'description':
        'Supports children with cancer and their families in need of assistance.',
    'logo': 'assets/association1.png',
  },
  {
    'name': 'Hope Foundation',
    'description':
        'A non-profit focused on providing education and healthcare to underprivileged communities.',
    'logo': 'assets/association2.png',
  },
  {
    'name': 'Charity for All',
    'description':
        'Helps families affected by natural disasters with food, shelter, and clothing.',
    'logo': 'assets/association3.png',
  },
  {
    'name': 'Future Leaders',
    'description':
        'Empowers youth through education and skill development programs.',
    'logo': 'assets/association4.png',
  },
  {
    'name': 'Green Earth Initiative',
    'description':
        'Promotes environmental conservation and sustainable development projects.',
    'logo': 'assets/association5.png',
  },
];

// Exemple de données des événements
final List<Map<String, String>> families = [
  {
    'name': 'Smith Family',
    'description': 'A family in need of winter clothing and food supplies.',
    'logo': 'assets/family1.png',
    'address': '123 Maple Street, Springfield',
    'needs': 'Winter coats, food supplies',
  },
  {
    'name': 'Johnson Family',
    'description': 'Single-parent family needing educational materials.',
    'logo': 'assets/family2.png',
    'address': '45 Oak Avenue, Rivertown',
    'needs': 'Books, school supplies',
  },
  {
    'name': 'Brown Family',
    'description': 'Large family affected by recent floods.',
    'logo': 'assets/family3.png',
    'address': '78 River Road, Lakeside',
    'needs': 'Furniture, clothing, food',
  },
  {
    'name': 'Garcia Family',
    'description': 'Immigrant family seeking support for integration.',
    'logo': 'assets/family4.png',
    'address': '9 Elm Street, Greenville',
    'needs': 'Language books, job resources',
  },
  {
    'name': 'Williams Family',
    'description': 'Elderly couple needing home repair assistance.',
    'logo': 'assets/family5.png',
    'address': '234 Pine Drive, Hilltop',
    'needs': 'Home repair tools, warm clothing',
  },
];
final List<Map<String, String>> events = [
  {
    'title': 'Winter Clothing Drive',
    'date': 'Oct 15, 2024',
    'description':
        'Collecting coats, scarves, and gloves to distribute during winter.',
    'image': 'assets/event1.png',
  },
  {
    'title': 'Back-to-School Supplies Giveaway',
    'date': 'Aug 10, 2024',
    'description':
        'Providing essential school supplies for low-income students.',
    'image': 'assets/event2.png',
  },
  {
    'title': 'Food Donation Collection',
    'date': 'Sep 25, 2024',
    'description':
        'Non-perishable food items needed for distribution to families in need.',
    'image': 'assets/event3.png',
  },
  {
    'title': 'Health and Wellness Workshop',
    'date': 'Nov 12, 2024',
    'description': 'Workshops on health, nutrition, and fitness for families.',
    'image': 'assets/event4.png',
  },
  // Ajoutez d'autres événements ici
];
