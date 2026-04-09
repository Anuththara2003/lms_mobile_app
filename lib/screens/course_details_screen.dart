import 'package:flutter/material.dart';
import '../models/course_model.dart';

class CourseDetailsScreen extends StatefulWidget {
  final Course course;
  const CourseDetailsScreen({super.key, required this.course});

  @override
  State<CourseDetailsScreen> createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
  // State management to track if the current lesson is finished
  bool _isCompleted = false;

  @override
  Widget build(BuildContext context) {
    // Fetching screen dimensions for a responsive layout
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.course.title, style: const TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---  RESPONSIVE HEADER IMAGE/ICON ---
            Container(
              height: screenHeight * 0.25, 
              width: double.infinity,
              color: Colors.indigo.withOpacity(0.05),
              child: Icon(
                Icons.cast_for_education, 
                size: screenWidth * 0.25, // Responsive icon size
                color: Colors.indigo
              ),
            ),

            Padding(
              // Using responsive padding based on screen width
              padding: EdgeInsets.all(screenWidth * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- SECTION 2: COURSE TITLES ---
                  Text(
                    widget.course.title,
                    style: TextStyle(
                      fontSize: screenWidth * 0.065, // Responsive font size
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo[900],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    "Instructor: ${widget.course.instructor}",
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      color: Colors.indigo,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  
                  SizedBox(height: screenHeight * 0.03),

                  // --- SECTION 3: ANIMATED FEEDBACK (Day 6 Feature) ---
                  Center(
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 600),
                      opacity: _isCompleted ? 1.0 : 0.0,
                      child: Column(
                        children: [
                          const Icon(Icons.check_circle, color: Colors.green, size: 60),
                          const SizedBox(height: 8),
                          Text(
                            "Course Completed Successfully!",
                            style: TextStyle(
                              color: Colors.green[700],
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.02),

                  // --- SECTION 4: COURSE DESCRIPTION ---
                  const Text(
                    "Course Description",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.course.description,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black87,
                      height: 1.5, // Better readability
                    ),
                  ),
                  
                  SizedBox(height: screenHeight * 0.04),

                  // --- SECTION 5: LESSON LIST ---
                  const Text(
                    "Curriculum",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  
                  // Generating dynamic dummy lessons
                  _buildLessonItem("01", "Introduction to the Framework", "12:30"),
                  _buildLessonItem("02", "Advanced UI Components", "45:00"),
                  _buildLessonItem("03", "Data Management & Models", "30:15"),
                ],
              ),
            ),
          ],
        ),
      ),
      
      // --- SECTION 6: RESPONSIVE ACTION BUTTON ---
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(screenWidth * 0.05),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
        ),
        child: ElevatedButton(
          onPressed: () {
            // Updating the UI state using setState
            setState(() {
              _isCompleted = !_isCompleted;
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: _isCompleted ? Colors.green : Colors.indigo,
            foregroundColor: Colors.white,
            minimumSize: Size(double.infinity, screenHeight * 0.07),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 2,
          ),
          child: Text(
            _isCompleted ? "COMPLETED" : "MARK AS COMPLETE",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  // Reusable widget to build individual lesson tiles
  Widget _buildLessonItem(String number, String title, String duration) {
    return Card(
      elevation: 0.5,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.indigo.withOpacity(0.1),
          child: Text(number, style: const TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold)),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        subtitle: Text(duration, style: const TextStyle(color: Colors.grey)),
        trailing: const Icon(Icons.play_circle_outline, color: Colors.indigo),
      ),
    );
  }
}