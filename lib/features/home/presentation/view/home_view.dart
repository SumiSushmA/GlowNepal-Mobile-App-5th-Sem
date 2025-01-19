import 'package:flutter/material.dart';
import 'package:glownepal_mobile_app_5th_sem/features/home/presentation/view/about_us_screen_view.dart';
import 'package:glownepal_mobile_app_5th_sem/features/home/presentation/view/home_page_view.dart';
import 'package:glownepal_mobile_app_5th_sem/features/home/presentation/view/profile_screen.dart';
import 'package:glownepal_mobile_app_5th_sem/features/home/presentation/view/see_all_stylish_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Specialist> specialists = [
    Specialist('Sumi', 'Hair Specialist', 4.0, 'assets/images/stylish1.jpg'),
    Specialist('Nitika', 'Nail Stylish', 4.5, 'assets/images/stylish2.jpg'),
    Specialist('Susmita', 'Makeup Artist', 4.2, 'assets/images/stylish3.jpg'),
  ];

  late final List<Widget> _screens = [
    const HomePageView(),
    SeeAllStylishView(specialists: specialists),
    const AboutUsScreenView(),
    const ProfileScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.brush),
            label: 'Stylish',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About Us',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
