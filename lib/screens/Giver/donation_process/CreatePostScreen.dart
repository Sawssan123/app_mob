import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:donation_app/screens/Giver/donation_process/ThankYouScreen.dart';

class CreatePostScreen extends StatefulWidget {
  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final TextEditingController _postController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  XFile? _selectedImage;

  Future<void> _pickImageFromGallery() async {
    var status = await Permission.storage.status;
    if (status.isDenied || status.isPermanentlyDenied) {
      // Demande la permission
      status = await Permission.storage.request();
    }

    if (status.isGranted) {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      setState(() {
        _selectedImage = pickedFile;
      });
    } else {
      // Afficher une alerte si l'autorisation est refusée
      _showPermissionDeniedDialog("gallery");
    }
  }

  Future<void> _takePhoto() async {
    if (await _requestPermission(Permission.camera)) {
      final pickedFile = await _picker.pickImage(source: ImageSource.camera);
      setState(() {
        _selectedImage = pickedFile;
      });
    }
  }

  Future<bool> _requestPermission(Permission permission) async {
    var status = await permission.status;

    if (status.isGranted) {
      return true;
    } else if (status.isDenied) {
      status = await permission.request();
      return status.isGranted;
    } else if (status.isPermanentlyDenied) {
      _showPermissionDeniedDialog(permission.toString().split('.').last);
      return false;
    }

    return false;
  }

  void _showPermissionDeniedDialog(String permissionType) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Permission Denied"),
          content: Text(
              "Permission to access the $permissionType is denied. Please enable it in settings."),
          actions: [
            TextButton(
              child: Text("Open Settings"),
              onPressed: () {
                openAppSettings();
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Post'),
        centerTitle: true,
        backgroundColor: Colors.grey[200],
        elevation: 0,
        actions: [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/banner.jpeg'),
                  radius: 20,
                ),
                SizedBox(width: 10),
                Text(
                  'Sandra Awelni',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            TextField(
              controller: _postController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'What do you want to share?',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(height: 20),
            if (_selectedImage != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Image.file(
                  File(_selectedImage!.path),
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.photo_camera_outlined),
                  onPressed: _takePhoto,
                ),
                IconButton(
                  icon: Icon(Icons.image_outlined),
                  onPressed: _pickImageFromGallery,
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ThankYouScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ThankYouScreen(),
                  ),
                );
              },
              child: Text('Donate'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
