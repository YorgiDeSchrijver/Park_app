import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'history_page.dart';
import 'navigation_page.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    NavigationPage(),
    HistoryPage(),
    ProfilePage(),
  ];

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 10.0,
          unselectedFontSize: 10.0,
          selectedItemColor: Colors.black87,
          unselectedItemColor: Colors.black87,
          selectedLabelStyle:
              TextStyle(height: 2.5, fontWeight: FontWeight.w500),
          unselectedLabelStyle:
              TextStyle(height: 2.5, fontWeight: FontWeight.w500),
          selectedIconTheme: const IconThemeData(
              size: 20.0, color: Color.fromARGB(255, 66, 181, 70)),
          unselectedIconTheme:
              IconThemeData(size: 20.0, color: Colors.grey[500]),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.local_parking),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.update),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'More',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
