import 'package:flutter/material.dart';
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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TaskerPage(category: categories[index]),
                  ),
                );
              },
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


