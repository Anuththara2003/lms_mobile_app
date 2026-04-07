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
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Assignments"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: assignments.length,
        itemBuilder: (context, index) {
          final item = assignments[index];
          
          return Card(
            margin: const EdgeInsets.only(bottom: 15),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 2,
            child: ListTile(
              contentPadding: const EdgeInsets.all(15),
              leading: CircleAvatar(
                backgroundColor: Colors.indigo.withOpacity(0.1),
                child: const Icon(Icons.assignment_outlined, color: Colors.indigo),
              ),
              title: Text(
                item.title,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.subject),
                  const SizedBox(height: 5),
                  Text("Due: ${item.dueDate}", style: const TextStyle(color: Colors.redAccent, fontSize: 13)),
                ],
              ),
              // මෙන්න Status Indicator එක
              trailing: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: item.isSubmitted ? Colors.green[100] : Colors.orange[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  item.isSubmitted ? "Submitted" : "Pending",
                  style: TextStyle(
                    color: item.isSubmitted ? Colors.green[800] : Colors.orange[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
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