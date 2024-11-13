// main.dart
import 'package:flutter/material.dart';
import 'main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Rabbit',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(), // MainPage with bottom navigation
    );
  }
}
