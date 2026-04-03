import 'package:flutter/material.dart';
import 'login_screen.dart'; 

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LMS Dashboard"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        actions: [
         
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 2. Greeting (Dummy Data)
            const Text(
              "Hello, User!", 
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.indigo),
            ),
            const Text("Ready to continue your learning journey?"),
            
            const SizedBox(height: 30),

            // 3. Progress Cards (Dummy Data)
            const Text("Your Progress", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            Row(
              children: [
                _buildCard("12", "Courses", Colors.orange),
                const SizedBox(width: 15),
                _buildCard("08", "Completed", Colors.green),
              ],
            ),
            
            const SizedBox(height: 30),

            // 4. Continue Learning (Dummy Data List)
            const Text("Continue Learning", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            
            _buildCourseItem("Flutter UI Basics", "Lesson 5 of 10"),
            _buildCourseItem("Dart for Beginners", "Lesson 2 of 12"),
            _buildCourseItem("Widget Lifecycle", "Lesson 1 of 05"),
          ],
        ),
      ),
    );
  }

  
  Widget _buildCard(String count, String label, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: color.withOpacity(0.5)),
        ),
        child: Column(
          children: [
            Text(count, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: color)),
            Text(label),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseItem(String title, String subtitle) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: const Icon(Icons.play_circle_fill, color: Colors.indigo, size: 40),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 14),
      ),
    );
  }
}