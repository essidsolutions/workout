// screens/taskers_list.dart
import 'package:flutter/material.dart';
import '../models/tasker.dart';
import '../services/tasker_service.dart';
import 'tasker_details.dart';

class TaskersList extends StatelessWidget {
  final String category;
  final String location;
  final double userLatitude;
  final double userLongitude;

  TaskersList({
    required this.category,
    required this.location,
    required this.userLatitude,
    required this.userLongitude,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Tasker>>(
      future: TaskerService.getTaskersForLocation(userLatitude, userLongitude),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No taskers found nearby.'));
        } else {
          final taskers = snapshot.data!;
          return Scaffold(
            appBar: AppBar(title: Text('Available Taskers')),
            body: ListView.builder(
              itemCount: taskers.length,
              itemBuilder: (ctx, i) => ListTile(
                title: Text(taskers[i].name),
                subtitle: Text('Experience: ${taskers[i].experience} years'),
                trailing: Text('\$${taskers[i].rate}/hr'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TaskerDetails(tasker: taskers[i]),
                    ),
                  );
                },
              ),
            ),
          );
        }
      },
    );
  }
}
