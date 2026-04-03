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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          
          Expanded(
            child: PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() { _currentPage = index; });
              },
              children: [
                _buildPage(Icons.school, "Learn Anywhere", "Access courses anytime, anywhere."),
                _buildPage(Icons.group, "Expert Tutors", "Learn from industry professionals."),
                _buildPage(Icons.trending_up, "Track Progress", "Monitor your learning success."),
              ],
            ),
          ),

          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) => Container(
              margin: const EdgeInsets.all(4),
              height: 10,
              width: _currentPage == index ? 20 : 10,
              decoration: BoxDecoration(
                color: _currentPage == index ? Colors.indigo : Colors.grey,
                borderRadius: BorderRadius.circular(5),
              ),
            )),
          ),

         
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: ElevatedButton(
              onPressed: () {
                if (_currentPage == 2) {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                } else {
                  _controller.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
                }
              },
              style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
              child: Text(_currentPage == 2 ? "GET STARTED" : "NEXT"),
            ),
          ),
        ],
      ),
    );
  }

  
  Widget _buildPage(IconData icon, String title, String desc) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 100, color: Colors.indigo),
        const SizedBox(height: 20),
        Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Text(desc, textAlign: TextAlign.center),
      ],
    );
  }
}