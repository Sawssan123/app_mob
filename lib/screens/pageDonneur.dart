import 'package:flutter/material.dart';
import 'package:donation_app/screens/ListeEvent.dart';
import 'package:donation_app/screens/ListeFamilies.dart';
// Importez la page de détails du produit
import 'package:donation_app/screens/ProductDetailScreen.dart';

class pageDonneur extends StatelessWidget {
  final List<Map<String, String>> items = [
    {'title': 'Clothing', 'subtitle': 'Jacket', 'image': 'assets/aaa.jpeg'},
    {'title': 'Clothing', 'subtitle': 'Shoes', 'image': 'assets/shoes.png'},
    {'title': 'Clothing', 'subtitle': '', 'image': 'assets/clothing.png'},
    {'title': 'Furniture', 'subtitle': '', 'image': 'assets/furniture.png'},
    {'title': 'Furniture', 'subtitle': '', 'image': 'assets/furniture.png'},
    {'title': 'Other', 'subtitle': '', 'image': 'assets/other.png'},
    {'title': 'Book', 'subtitle': '', 'image': 'assets/book.png'},
    {'title': 'Book', 'subtitle': '', 'image': 'assets/book.png'},
    {'title': 'Furniture', 'subtitle': '', 'image': 'assets/furniture.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F4F4),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.brown),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Donation', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.grey[100],
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.person, color: Colors.brown),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.search, color: Colors.brown),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Donation',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text('Association', style: TextStyle(color: Colors.grey)),
                Text('Events', style: TextStyle(color: Colors.grey)),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                itemCount: items.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  final item = items[index];
                  return GestureDetector(
                    onTap: () {
                      // Naviguer vers ProductDetailScreen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailScreen(),
                        ),
                      );
                    },
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: item['image'] != null
                                  ? Image.asset(
                                      item['image']!,
                                      fit: BoxFit.cover,
                                    )
                                  : Icon(Icons.image, color: Colors.grey),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Text(
                              item['title']!,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          if (item['subtitle'] != null &&
                              item['subtitle']!.isNotEmpty)
                            Text(
                              item['subtitle']!,
                              style: TextStyle(color: Colors.grey),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Centrer les boutons
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ListeFamilies()),
                    );
                  },
                  child: Text(
                    'list of families',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,
                    minimumSize: Size(150, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                SizedBox(width: 20), // Espacement entre les boutons
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ListeEvent()),
                    );
                  },
                  child: Text(
                    'list of event',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,
                    minimumSize: Size(150, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
