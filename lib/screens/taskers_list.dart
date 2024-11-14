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
          return _buildNoTaskersFound(context);
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

  // Custom widget to show when no taskers are found
  Widget _buildNoTaskersFound(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Available Taskers')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://via.placeholder.com/150',
                width: 150,
                height: 150,
              ),
              SizedBox(height: 20),
              Text(
                'No Taskers Found Nearby',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'It looks like there are no taskers available near "$location". '
                'Please try a different location or check back later.',
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Back to Search'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
