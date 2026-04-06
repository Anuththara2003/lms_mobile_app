import 'package:flutter/material.dart';
import '../models/course_model.dart'; 

class CourseListScreen extends StatelessWidget {
  CourseListScreen({super.key});

  
  final List<Course> courses = [
    Course(
      title: "Flutter UI Development",
      instructor: "Prof. Sandaru",
      image: "assets/images/logo2.png",
      description: "Learn to build beautiful mobile UIs from scratch.",
      lessons: "12 Lessons",
    ),
    Course(
      title: "Dart Programming Basics",
      instructor: "Dr. Binu",
      image: "assets/images/logo2.png",
      description: "Master the foundation of Flutter apps.",
      lessons: "10 Lessons",
    ),
    Course(
      title: "Firebase Guide",
      instructor: "Admin",
      image: "assets/images/logo2.png",
      description: "Connect your app to a real-time database.",
      lessons: "08 Lessons",
    ),
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
          final course = courses[index];
          
          return Card(
            elevation: 3,
            margin: const EdgeInsets.only(bottom: 15),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.indigo.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.menu_book, color: Colors.indigo, size: 35),
              ),
              title: Text(
                course.title,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Text("By ${course.instructor}"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Loading details for: ${course.title}")),
                );
              },
            ),
          );
        },
      ),
    );
  }
}