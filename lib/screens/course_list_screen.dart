import 'package:flutter/material.dart';


class CourseListScreen extends StatelessWidget {
  const CourseListScreen({super.key});

  final List<Map<String, String>> courses = const [
    {"title": "Flutter UI Development", "instructor": "Prof. Sandaru", "image": "assets/images/logo2.png"},
    {"title": "Dart Programming Basics", "instructor": "Dr. Binu", "image": "assets/images/logo2.png"},
    {"title": "Firebase for Beginners", "instructor": "Admin", "image": "assets/images/logo2.png"},
    {"title": "State Management Guide", "instructor": "Expert X", "image": "assets/images/logo2.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Courses"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: courses.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 3,
            margin: const EdgeInsets.only(bottom: 15),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              contentPadding: const EdgeInsets.all(10),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: const Icon(Icons.school, size: 50, color: Colors.indigo), 
              ),
              title: Text(
                courses[index]['title']!,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Text("By ${courses[index]['instructor']}"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
              
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Course: ${courses[index]['title']} - Coming Soon!")),
                );
              },
            ),
          );
        },
      ),
    );
  }
}