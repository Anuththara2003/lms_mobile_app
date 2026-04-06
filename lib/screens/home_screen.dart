import 'package:flutter/material.dart';
import 'login_screen.dart'; 
import 'course_list_screen.dart'; 

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
            const Text(
              "Hello, User!", 
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.indigo),
            ),
            const Text("Ready to continue your learning journey?"),
            const SizedBox(height: 30),
            const Text("Your Progress", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            Row(
              children: [
                _buildCard(context, "12", "Courses", Colors.orange),
                const SizedBox(width: 15),
                _buildCard(context, "08", "Completed", Colors.green),
              ],
            ),
            const SizedBox(height: 30),
            const Text("Continue Learning", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            _buildCourseItem(context, "Flutter UI Basics", "Lesson 5 of 10"),
            _buildCourseItem(context, "Dart for Beginners", "Lesson 2 of 12"),
            _buildCourseItem(context, "Widget Lifecycle", "Lesson 1 of 05"),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, String count, String label, Color color) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          // 'const' අයින් කළා, දැන් CourseListScreen එකට යනවා
          Navigator.push(context, MaterialPageRoute(builder: (context) => CourseListScreen()));
        },
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
      ),
    );
  }

  Widget _buildCourseItem(BuildContext context, String title, String subtitle) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: const Icon(Icons.play_circle_fill, color: Colors.indigo, size: 40),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 14),
        onTap: () {
          // 'const' අයින් කළා, දැන් CourseListScreen එකට යනවා
          Navigator.push(context, MaterialPageRoute(builder: (context) => CourseListScreen()));
        },
      ),
    );
  }
}