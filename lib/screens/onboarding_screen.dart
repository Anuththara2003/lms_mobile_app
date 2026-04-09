import 'package:flutter/material.dart';
import 'login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Main content area with PageView
          Expanded(
            child: PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() { _currentPage = index; });
              },
              children: [
                _buildPage(context, Icons.school, "Learn Anywhere", "Access your educational materials anytime and anywhere."),
                _buildPage(context, Icons.group, "Expert Tutors", "Get guidance from the best industry professionals."),
                _buildPage(context, Icons.trending_up, "Track Success", "Keep a close eye on your learning milestones."),
              ],
            ),
          ),

          // Custom animated dot indicators
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.all(4),
              height: 10,
              width: _currentPage == index ? 25 : 10,
              decoration: BoxDecoration(
                color: _currentPage == index ? Colors.indigo : Colors.grey[300],
                borderRadius: BorderRadius.circular(5),
              ),
            )),
          ),

          // Action Button Section
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.1),
            child: ElevatedButton(
              onPressed: () {
                if (_currentPage == 2) {
                  
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                } else {
               
                  _controller.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, screenHeight * 0.07),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              ),
              child: Text(
                _currentPage == 2 ? "GET STARTED" : "NEXT",
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

 
  Widget _buildPage(BuildContext context, IconData icon, String title, String desc) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: screenWidth * 0.3, color: Colors.indigo),
          const SizedBox(height: 30),
          Text(
            title, 
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: screenWidth * 0.065, fontWeight: FontWeight.bold, color: Colors.indigo[900])
          ),
          const SizedBox(height: 15),
          Text(desc, textAlign: TextAlign.center, style: const TextStyle(fontSize: 15, color: Colors.grey)),
        ],
      ),
    );
  }
}