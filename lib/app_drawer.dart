// Create a drawer that contains the user profile and the app settings

// app_drawer.dart
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Mohamed Essid',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.pop(context, );
            },
          ), ListTile(
            leading: Icon(Icons.settings),
            title: Text('About Us'),
            onTap: () {
              Navigator.pop(context, );
            },
          ),
          // Add more ListTiles for other pages here
        ],
      ),
    );
  }
}
