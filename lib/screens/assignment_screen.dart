import 'package:flutter/material.dart';
import '../models/assignment_model.dart';

class AssignmentScreen extends StatelessWidget {
  AssignmentScreen({super.key});


  final List<Assignment> assignments = [
    Assignment(
      title: "UI Design Principles",
      subject: "Mobile Development",
      dueDate: "Oct 25, 2023",
      isSubmitted: true,
    ),
    Assignment(
      title: "Dart Basics Quiz",
      subject: "Programming",
      dueDate: "Oct 28, 2023",
      isSubmitted: false,
    ),
    Assignment(
      title: "Firebase Integration",
      subject: "Backend Basics",
      dueDate: "Nov 02, 2023",
      isSubmitted: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
   
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[50], 
      appBar: AppBar(
        title: const Text("My Assignments", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        elevation: 0, 
      ),
      body: ListView.builder(
        // Responsive padding based on screen width
        padding: EdgeInsets.all(screenWidth * 0.04),
        itemCount: assignments.length,
        itemBuilder: (context, index) {
          final item = assignments[index];
          
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 1,
            child: ListTile(
              // Responsive content padding
              contentPadding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04, 
                vertical: 10
              ),
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.indigo.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.assignment_rounded, 
                  color: Colors.indigo, 
                  size: screenWidth * 0.07 // Responsive icon size
                ),
              ),
              title: Text(
                item.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold, 
                  fontSize: screenWidth * 0.045 // Responsive font size
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 6.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.subject, style: const TextStyle(color: Colors.black54)),
                    const SizedBox(height: 4),
                    Text(
                      "Due: ${item.dueDate}", 
                      style: const TextStyle(color: Colors.redAccent, fontSize: 12, fontWeight: FontWeight.w500)
                    ),
                  ],
                ),
              ),
              // --- RESPONSIVE STATUS INDICATOR ) ---
              trailing: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: item.isSubmitted ? Colors.green[50] : Colors.orange[50],
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: item.isSubmitted ? Colors.green.shade200 : Colors.orange.shade200
                  ),
                ),
                child: Text(
                  item.isSubmitted ? "Submitted" : "Pending",
                  style: TextStyle(
                    color: item.isSubmitted ? Colors.green[800] : Colors.orange[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}