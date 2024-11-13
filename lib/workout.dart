// contains the histories of the user's workout

import 'package:flutter/material.dart';
import 'package:workout/app_drawer.dart';

class WorkoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workout Page'),
      ),
      body: Center(
        child: const Text('Workout Page Content'),
      ),drawer: AppDrawer(),
    );
  }
}