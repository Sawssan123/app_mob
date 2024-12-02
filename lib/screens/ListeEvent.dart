import 'package:flutter/material.dart';
import 'package:donation_app/screens/EventForm.dart';

class ListeEvent extends StatelessWidget {
  final List<Event> events = [
    Event(
      title: "Winter Clothing Drive",
      date: "October 15, 2024",
      address: "123 Charity Blvd, Citytown",
      description:
          "Collect warm clothes for families in need during winter. Accepting coats, scarves, and gloves.",
      imageUrl: "https://via.placeholder.com/150",
      likes: 3,
    ),
    Event(
      title: "Back-to-School Supplies Giveaway",
      date: "August 25, 2024",
      address: "456 Education Ave, Learnville",
      description:
          "Distribute school supplies to children for the upcoming school year. Open to all registered families.",
      imageUrl: "https://via.placeholder.com/150",
      likes: 4,
    ),
    Event(
      title: "Food Donation Collection",
      date: "November 10, 2024",
      address: "789 Hope St, Community Center",
      description:
          "Collect non-perishable food items for holiday meals. Items will be distributed to low-income families.",
      imageUrl: "https://via.placeholder.com/150",
      likes: 3,
    ),
    Event(
      title: "Health and Wellness Workshop",
      date: "September 12, 2024",
      address: "321 Wellness Ln, Healthtown",
      description:
          "Free health checkups and wellness tips for families. Volunteers and donors are welcome to join.",
      imageUrl: "https://via.placeholder.com/150",
      likes: 3,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F4F4),
      appBar: AppBar(
        title: Center(
          child: Text(
            'Events',
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.grey[100],
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          return EventCard(event: events[index]);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EventForm()),
          );
        },
        label: Text("Create New Event", style: TextStyle(color: Colors.white)),
        icon: Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.brown,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class Event {
  final String title;
  final String date;
  final String address;
  final String description;
  final String imageUrl;
  final int likes;

  Event({
    required this.title,
    required this.date,
    required this.address,
    required this.description,
    required this.imageUrl,
    required this.likes,
  });
}

class EventCard extends StatelessWidget {
  final Event event;

  EventCard({required this.event});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Image.network(
              event.imageUrl,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text("Date: ${event.date}"),
                  Text("Address: ${event.address}"),
                  SizedBox(height: 6),
                  Text(
                    event.description,
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.favorite, color: Colors.red),
                        onPressed: () {
                          // Action to like the event
                        },
                      ),
                      Text('${event.likes}'),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: () {
                // Action to view more details about the event
              },
            ),
          ],
        ),
      ),
    );
  }
}
