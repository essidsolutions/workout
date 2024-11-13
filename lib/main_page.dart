// main_page.dart
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'settings_page.dart';
import 'profile_page.dart';
import 'app_drawer.dart';
import 'app_bar.dart';
import 'bottom_nav_bar.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    SettingsPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: _pages[_selectedIndex],
      drawer: AppDrawer(),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
