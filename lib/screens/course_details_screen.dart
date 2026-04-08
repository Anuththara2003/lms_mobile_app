import 'package:flutter/material.dart';
import '../models/course_model.dart';

class CourseDetailsScreen extends StatefulWidget {
  final Course course;
  const CourseDetailsScreen({super.key, required this.course});

  @override
  State<CourseDetailsScreen> createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
  
  bool _isCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.course.title),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.indigo.withOpacity(0.1),
              child: const Icon(Icons.cast_for_education, size: 100, color: Colors.indigo),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.course.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text("Instructor: ${widget.course.instructor}", style: const TextStyle(fontSize: 16, color: Colors.indigo, fontWeight: FontWeight.w500)),
                  
                  const SizedBox(height: 30),

                  
                  Center(
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 600),
                      opacity: _isCompleted ? 1.0 : 0.0,
                      child: const Column(
                        children: [
                          Icon(Icons.check_circle, color: Colors.green, size: 60),
                          Text("Lesson Completed!", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                  const Text("Course Description", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  const Text(
                    "This is a comprehensive course designed for beginners. You will learn the core concepts and practical skills to master this subject. Includes hands-on projects and quizzes.",
                    style: TextStyle(fontSize: 15, color: Colors.black87, height: 1.5),
                  ),
                  const SizedBox(height: 30),

                  const Text("Lessons in this Course", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 15),
                  _buildLessonItem("01", "Introduction to the Topic", "10:00 mins"),
                  _buildLessonItem("02", "Core Concepts & Theory", "25:30 mins"),
                  _buildLessonItem("03", "Practical Examples", "15:45 mins"),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ElevatedButton(
          onPressed: () {
            
            setState(() {
              _isCompleted = !_isCompleted;
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: _isCompleted ? Colors.green : Colors.indigo,
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 55),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          child: Text(_isCompleted ? "COMPLETED" : "MARK AS COMPLETE", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  Widget _buildLessonItem(String number, String title, String duration) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.indigo.withOpacity(0.1),
          child: Text(number, style: const TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold)),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        subtitle: Text(duration),
        trailing: const Icon(Icons.play_circle_outline, color: Colors.indigo),
      ),
    );
  }
}