import 'package:flutter/material.dart';
import '../widgets/custom_button.dart'; 

class ProfileScreen extends StatelessWidget {
  final String userEmail; 

  const ProfileScreen({super.key, required this.userEmail});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("My Profile", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(screenWidth * 0.06),
        child: Column(
          children: [
            // Responsive Profile Avatar
            CircleAvatar(
              radius: screenWidth * 0.15,
              backgroundColor: Colors.indigo.withOpacity(0.1),
              child: Icon(Icons.person, size: screenWidth * 0.18, color: Colors.indigo),
            ),
            
            SizedBox(height: size.height * 0.02),
            
            // Extracting name from email and styling it
            Text(
              userEmail.split('@')[0].toUpperCase(), 
              style: TextStyle(fontSize: screenWidth * 0.06, fontWeight: FontWeight.bold, color: Colors.indigo[900])
            ),
            
            Text(userEmail, style: const TextStyle(color: Colors.grey, fontSize: 14)),
            
            const Divider(height: 50, thickness: 1), 
            
            // Displaying user activity statistics
            _buildProfileInfo(context, Icons.book_rounded, "Completed Courses", "08"),
            _buildProfileInfo(context, Icons.assignment_turned_in_rounded, "Assignments Done", "15"),
            
            SizedBox(height: size.height * 0.25), // Spacing to push button down

            // Using the Reusable Custom Button
            CustomButton(
              text: "EDIT PROFILE", 
              onPressed: () {
                debugPrint("Edit Profile Clicked!");
              },
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget to display list-based profile information
  Widget _buildProfileInfo(BuildContext context, IconData icon, String title, String value) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(color: Colors.indigo.withOpacity(0.05), shape: BoxShape.circle),
        child: Icon(icon, color: Colors.indigo, size: 22),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      trailing: Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.indigo)),
    );
  }
}