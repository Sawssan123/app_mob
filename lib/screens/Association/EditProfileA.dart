import 'package:flutter/material.dart';

class EditProfileA extends StatelessWidget {
  final TextEditingController nameController = TextEditingController(text: 'Association Name');
  final TextEditingController emailController = TextEditingController(text: 'association@example.com');
  final TextEditingController phoneController = TextEditingController(text: '+256 700000000');
  final TextEditingController locationController = TextEditingController(text: 'Location, City, Country');
  final TextEditingController descriptionController = TextEditingController(text: 'Description of the association');

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
          'Edit Association Profile',
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
            buildTextField('Association Name', nameController),
            buildTextField('Email Address', emailController),
            buildTextField('Phone Number', phoneController),
            buildTextField('Location', locationController),
            buildTextField('Description', descriptionController, maxLines: 3), // Description field
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller, {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
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
