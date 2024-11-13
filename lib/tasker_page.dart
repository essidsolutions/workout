// category_page.dart
import 'package:flutter/material.dart';
import 'tasker.dart';
import 'tasker_detail_page.dart';

class TaskerPage extends StatelessWidget {
  final String category;
  final List<Tasker> taskers = [
    Tasker(name: 'John Doe', imageUrl: 'https://via.placeholder.com/150', pricePerHour: 25.0),
    Tasker(name: 'Jane Smith', imageUrl: 'https://via.placeholder.com/150', pricePerHour: 30.0),
    Tasker(name: 'Sam Wilson', imageUrl: 'https://via.placeholder.com/150', pricePerHour: 20.0),
  ];

  TaskerPage({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: ListView.builder(
        itemCount: taskers.length,
        itemBuilder: (context, index) {
          final tasker = taskers[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(tasker.imageUrl),
              ),
              title: Text(tasker.name),
              subtitle: Text('\$${tasker.pricePerHour}/hour'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TaskerDetailPage(tasker: tasker),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
