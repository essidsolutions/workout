import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'tasker_page.dart';

class HomePage extends StatelessWidget {
  final List<String> categories = [
    'Construction',
    'Cleaning',
    'Moving',
    'Electrical',
    'Canalization',
    'Carpentry',
    'Painting',
    'Transport',
    'Air Conditioner',
  ];

  Future<void> _navigateToTaskerPage(BuildContext context, String category) async {
    try {
      // Request permission for location
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        // Show a message if location access is denied
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Location permission denied")),
        );
        return;
      }

      // Get current location
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // Navigate to TaskerPage with category and location
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TaskerPage(
            category: category,
            latitude: position.latitude,
            longitude: position.longitude,
          ),
        ),
      );
    } catch (e) {
      // Handle any errors related to location
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error getting location: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => _navigateToTaskerPage(context, categories[index]),
              child: Card(
                elevation: 4.0,
                child: Center(
                  child: Text(
                    categories[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
class TaskerPage extends StatelessWidget {
  final String category;
  final double latitude;
  final double longitude;

  TaskerPage({
    required this.category,
    required this.latitude,
    required this.longitude,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Taskers for $category'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Category: $category'),
            Text('Latitude: $latitude'),
            Text('Longitude: $longitude'),
            // Add your logic to fetch and display taskers by area here
          ],
        ),
      ),
    );
  }
}