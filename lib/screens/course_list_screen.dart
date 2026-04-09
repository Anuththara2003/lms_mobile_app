import 'package:flutter/material.dart';
import '../models/course_model.dart'; 
import 'course_details_screen.dart'; 

class CourseListScreen extends StatelessWidget {
  CourseListScreen({super.key});

  // Mock data for available courses
  final List<Course> courses = [
    Course(
      title: "Flutter UI Development",
      instructor: "Prof. Sandaru",
      image: "assets/images/logo.png",
      description: "Learn to build beautiful, high-performance mobile UIs from scratch using Flutter Layouts.",
      lessons: "12 Lessons",
    ),
    Course(
      title: "Dart Programming Basics",
      instructor: "Dr. Binu",
      image: "assets/images/logo.png",
      description: "Master the foundation of Flutter. Understand variables, functions, and OOP concepts in Dart.",
      lessons: "10 Lessons",
    ),
    Course(
      title: "Firebase Guide",
      instructor: "Admin",
      image: "assets/images/logo.png",
      description: "Securely connect your Flutter application to real-time databases and handle cloud authentication.",
      lessons: "08 Lessons",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("All Courses", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        // Optimized list rendering for performance
        padding: const EdgeInsets.all(15),
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          
          return Card(
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.indigo.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.menu_book_rounded, color: Colors.indigo, size: screenWidth * 0.08),
              ),
              title: Text(
                course.title,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  "By ${course.instructor}\n${course.lessons}",
                  style: const TextStyle(color: Colors.grey, height: 1.4),
                ),
              ),
              isThreeLine: true, // Allows extra space for the two-line subtitle
              trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Colors.indigo),
              onTap: () {
                // Navigating to course details and passing the selected course object
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CourseDetailsScreen(course: course),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}