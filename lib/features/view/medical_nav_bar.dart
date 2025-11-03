import 'package:flutter/material.dart';

import 'analysis_screen.dart';
import 'home_screen.dart';
import 'profile_screen.dart';

class MedicalNavBar extends StatefulWidget {
  const MedicalNavBar({super.key});

  @override
  State<MedicalNavBar> createState() => _MedicalNavBarState();
}

class _MedicalNavBarState extends State<MedicalNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [HomeScreen(), AnalysisScreen(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment_rounded), label: 'Analysis'),
          BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: 'Profile'),
        ],
      ),
    );
  }
}
