// contains the histories of the user's workout

import 'package:flutter/material.dart';
import 'package:workout/app_drawer.dart';

class ActivityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity Page'),
      ),
      body: Center(
        child: const Text('Activity Page Content'),
      ),drawer: AppDrawer(),
    );
  }
}