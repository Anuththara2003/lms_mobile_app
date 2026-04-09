import 'dart:async';
import 'package:flutter/material.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

   
    Timer(const Duration(seconds: 3), () {
      if (!mounted) return;

      // Ensuring navigation happens after the frame is built to avoid errors
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const OnboardingScreen()),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
   
    final size = MediaQuery.of(context).size;
    final screenHeight = size.height;
    final screenWidth = size.width;

    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)]
              ),
              child: Image.asset(
                'assets/images/logo2.png',
                height: screenHeight * 0.12, 
                width: screenHeight * 0.12,
                errorBuilder: (context, error, stackTrace) => Icon(
                  Icons.school, 
                  size: screenWidth * 0.2, 
                  color: Colors.indigo
                ),
              ),
            ),

            SizedBox(height: screenHeight * 0.04),

            Text(
              "LMS LEARNING",
              style: TextStyle(
                fontSize: screenWidth * 0.07, 
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 2.5,
              ),
            ),

            SizedBox(height: screenHeight * 0.01),

            Text(
              "Start your journey today",
              style: TextStyle(
                fontSize: screenWidth * 0.04,
                color: Colors.white70,
              ),
            ),

            SizedBox(height: screenHeight * 0.08),

            // Loading indicator to show progress
            const CircularProgressIndicator(color: Colors.white),
          ],
        ),
      ),
    );
  }
}