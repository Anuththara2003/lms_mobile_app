import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'course_list_screen.dart';
import 'assignment_screen.dart';
import 'profile_screen.dart';

class MainWrapper extends StatefulWidget {
  final String userName;
  final String userEmail;

  const MainWrapper({super.key, required this.userName, required this.userEmail});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  
  int _selectedIndex = 0; 

  @override
  Widget build(BuildContext context) {
   
    final List<Widget> _pages = [
      HomeScreen(userName: widget.userName, userEmail: widget.userEmail),
      CourseListScreen(),
      AssignmentScreen(),
      ProfileScreen(userEmail: widget.userEmail),
    ];

    return Scaffold(
   
      body: _pages[_selectedIndex],
      
      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, 
        onTap: (index) {
          
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed, 
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.book_rounded), label: "Courses"),
          BottomNavigationBarItem(icon: Icon(Icons.assignment_turned_in_rounded), label: "Tasks"),
          BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: "Profile"),
        ],
      ),
    );
  }
}