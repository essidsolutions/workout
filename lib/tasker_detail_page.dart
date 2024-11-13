// tasker_detail_page.dart
import 'package:flutter/material.dart';
import 'tasker.dart';

class TaskerDetailPage extends StatelessWidget {
  final Tasker tasker;

  TaskerDetailPage({required this.tasker});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tasker.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(tasker.imageUrl),
            ),
            SizedBox(height: 20),
            Text(
              tasker.name,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 10),
            Text(
              '\$${tasker.pricePerHour}/hour',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
