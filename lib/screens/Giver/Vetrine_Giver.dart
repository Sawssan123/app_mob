import 'package:donation_app/screens/Giver/donation_process/DonationTypeSelection.dart';
import 'package:donation_app/screens/sign_in.dart';
import 'package:donation_app/screens/ProductDetailScreen.dart';
import 'package:flutter/material.dart';

class VetrineGiverScreen extends StatefulWidget {
  @override
  _VetrineGiverScreenState createState() => _VetrineGiverScreenState();
}

class _VetrineGiverScreenState extends State<VetrineGiverScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
          // Naviguer vers ProductDetailScreen avec des données
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailScreen(
                
              ),
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
          // Afficher le bouton seulement si l'onglet "Donation" est actif
          if (_tabController.index == 0)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DonationTypeSelection(),
                    ),
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
                  "Add New Item",
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
];
