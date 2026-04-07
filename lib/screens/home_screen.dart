import 'package:flutter/material.dart';
import 'login_screen.dart'; 
import 'course_list_screen.dart'; 
import 'profile_screen.dart'; 
import 'assignment_screen.dart'; 
import '../widgets/custom_button.dart'; 

class HomeScreen extends StatelessWidget {
  final String userName; 
  final String userEmail; 

 
  const HomeScreen({super.key, required this.userName, required this.userEmail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50], 
      appBar: AppBar(
        title: const Text("LMS Dashboard", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_rounded),
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
            // 1. Greeting Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hello, $userName!", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.indigo[900])),
                    const Text("Ready to learn something new today?", style: TextStyle(color: Colors.grey)),
                  ],
                ),
                
                GestureDetector(
                  onTap: () {
                    
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(userEmail: userEmail),
                      ),
                    );
                  },
                  child: const CircleAvatar(
                    radius: 25, 
                    backgroundColor: Colors.indigo, 
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                )
              ],
            ),
            
            const SizedBox(height: 30),

            // 2. Your Success Section
            const Text("Your Success", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            Row(
              children: [
                _buildCard(context, "12", "Courses", Icons.book_online, Colors.orange,  CourseListScreen()),
                const SizedBox(width: 15),
                _buildCard(context, "08", "Completed", Icons.check_circle_outline, Colors.green, null),
              ],
            ),
            
            const SizedBox(height: 30),

            // 3. My Tasks Section
            const Text("My Tasks", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            CustomButton(
              text: "VIEW ALL ASSIGNMENTS", 
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AssignmentScreen()));
              },
            ),

            const SizedBox(height: 30),

            // 4. Continue Learning Section 
            const Text("Continue Learning", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            
            _buildCourseItem(context, "Flutter UI Basics", "Lesson 5 of 10", 0.5),
            _buildCourseItem(context, "Dart for Beginners", "Lesson 2 of 12", 0.2),
            
            const SizedBox(height: 15),

            CustomButton(
              text: "SEE ALL COURSES", 
              color: Colors.indigo.shade400,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  CourseListScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }

  // Card Widget එක
  Widget _buildCard(BuildContext context, String count, String label, IconData icon, Color color, Widget? targetPage) {
    return Expanded(
      child: GestureDetector(
        onTap: targetPage == null ? null : () => Navigator.push(context, MaterialPageRoute(builder: (context) => targetPage)),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [BoxShadow(color: color.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 5))],
            border: Border.all(color: color.withOpacity(0.2)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: color, size: 30),
              const SizedBox(height: 15),
              Text(count, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.indigo[900])),
              Text(label, style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w500)),
            ],
          ),
        ),
      ),
    );
  }

  // Course Item Widget එක
  Widget _buildCourseItem(BuildContext context, String title, String subtitle, double progress) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10)]),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        leading: Container(padding: const EdgeInsets.all(10), decoration: BoxDecoration(color: Colors.indigo.withOpacity(0.1), shape: BoxShape.circle), child: const Icon(Icons.play_arrow_rounded, color: Colors.indigo)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: [
            Text(subtitle), 
            const SizedBox(height: 8), 
            LinearProgressIndicator(value: progress, backgroundColor: Colors.grey[200], color: Colors.indigo, minHeight: 4)
          ]
        ),
        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 14, color: Colors.grey),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) =>  CourseListScreen())),
      ),
    );
  }
}