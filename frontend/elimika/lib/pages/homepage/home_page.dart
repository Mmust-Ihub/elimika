import 'package:elimika/pages/homepage/screens/chat_screen.dart';
import 'package:elimika/pages/homepage/screens/class_screen.dart';
import 'package:elimika/pages/homepage/screens/home_screen.dart';
import 'package:elimika/pages/homepage/screens/profile_screen.dart';
import 'package:elimika/pages/homepage/screens/result_screen.dart';
import 'package:elimika/pages/homepage/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  final List<Widget> _screens = [
    const HomeDashboard(),
    const PersonalizedScreen(),
    AssessmentsScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[currentIndex],
      bottomNavigationBar:
          BottomNavBar(currentIndex: currentIndex, onTap: onTap),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const ChatScreen()))
        },
        child: const Icon(
          Icons.chat_bubble_outline,
          color: Colors.blue,
        ),
      ),
    );
  }
}
