// screens/tasker_details.dart
import 'package:flutter/material.dart';
import '../models/tasker.dart';

class TaskerDetails extends StatelessWidget {
  final Tasker tasker;

  TaskerDetails({required this.tasker});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(tasker.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
            SizedBox(height: 20),
            Text(tasker.name, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Experience: ${tasker.experience} years', style: TextStyle(fontSize: 18)),
            Text('Rate: \$${tasker.rate}/hr', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            Text(
              'Bio: ${tasker.name} is a skilled professional with ${tasker.experience} years of experience.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
