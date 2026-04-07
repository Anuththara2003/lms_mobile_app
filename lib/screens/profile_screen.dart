import 'package:flutter/material.dart';
import '../widgets/custom_button.dart'; 

class ProfileScreen extends StatelessWidget {
  final String userEmail; 

  
  const ProfileScreen({super.key, required this.userEmail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.indigo,
              child: Icon(Icons.person, size: 60, color: Colors.white),
            ),
            const SizedBox(height: 20),
            
          
            Text(
              userEmail.split('@')[0], 
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)
            ),
            
            
            Text(userEmail, style: const TextStyle(color: Colors.grey)),
            
            const Divider(height: 40), 
            
            _buildProfileInfo(Icons.book, "Completed Courses", "08"),
            _buildProfileInfo(Icons.assignment, "Assignments Done", "15"),
            
            const Spacer(), 

            CustomButton(
              text: "EDIT PROFILE", 
              onPressed: () {
                print("Edit Profile Clicked!");
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileInfo(IconData icon, String title, String value) {
    return ListTile(
      leading: Icon(icon, color: Colors.indigo),
      title: Text(title),
      trailing: Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
    );
  }
}