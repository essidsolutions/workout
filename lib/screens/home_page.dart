// screens/home_page.dart
import 'package:flutter/material.dart';
import 'task_location_form.dart';

class HomePage extends StatelessWidget {
  final List<String> categories = [
    'Cleaning',
    'Plumbing',
    'Electrical',
    'Moving',
    'Gardening',
    // Add more categories as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Find a Tasker')),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search tasks...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              padding: const EdgeInsets.all(10),
              itemCount: categories.length,
              itemBuilder: (ctx, i) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TaskLocationForm(category: categories[i]),
                    ),
                  );
                },
                child: Card(
                  elevation: 3,
                  child: Center(child: Text(categories[i], style: TextStyle(fontSize: 18))),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
