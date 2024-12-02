import 'package:flutter/material.dart';

class EditProfileD extends StatelessWidget {
  final TextEditingController nameController = TextEditingController(text: 'Sandra Awiiri');
  final TextEditingController emailController = TextEditingController(text: 'anna.alvaddo@gmail.com');
  final TextEditingController phoneController = TextEditingController(text: '+256 704688781');
  final TextEditingController locationController = TextEditingController(text: 'Najjera1, Kampala, Uganda');

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
          'Edit Profile',
          style: TextStyle(color: Colors.brown),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.save, color: Colors.brown),
            onPressed: () {
              // Save action here
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.pink[100],
              child: IconButton(
                icon: Icon(Icons.edit, color: Colors.white),
                onPressed: () {
                  // Change profile picture action
                },
              ),
            ),
            SizedBox(height: 20),
            buildTextField('Full Names', nameController),
            buildTextField('Email Address', emailController),
            buildTextField('Phone Number', phoneController),
            buildTextField('Location', locationController),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.brown),
          border: UnderlineInputBorder(),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.brown),
          ),
        ),
      ),
    );
  }
}
