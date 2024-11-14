// screens/task_location_form.dart
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'taskers_list.dart';

class TaskLocationForm extends StatefulWidget {
  final String category;

  TaskLocationForm({required this.category});

  @override
  _TaskLocationFormState createState() => _TaskLocationFormState();
}

class _TaskLocationFormState extends State<TaskLocationForm> {
  final _locationController = TextEditingController();
  double? selectedLatitude;
  double? selectedLongitude;

  Future<List<Map<String, dynamic>>> _fetchLocations(String query) async {
    final url = Uri.parse(
      "https://nominatim.openstreetmap.org/search?q=$query&format=json&addressdetails=1&limit=5",
    );
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((e) => {
        "name": e["display_name"],
        "lat": double.parse(e["lat"]),
        "lon": double.parse(e["lon"]),
      }).toList();
    } else {
      throw Exception('Failed to load location suggestions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Specify Task Location')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TypeAheadFormField(
              textFieldConfiguration: TextFieldConfiguration(
                controller: _locationController,
                decoration: InputDecoration(
                  labelText: "Enter task location",
                  border: OutlineInputBorder(),
                ),
              ),
              suggestionsCallback: (pattern) async {
                return await _fetchLocations(pattern);
              },
              itemBuilder: (context, suggestion) {
                return ListTile(
                  title: Text(suggestion['name']),
                );
              },
              onSuggestionSelected: (suggestion) {
                _locationController.text = suggestion['name'];
                selectedLatitude = suggestion['lat'];
                selectedLongitude = suggestion['lon'];
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_locationController.text.isNotEmpty &&
                    selectedLatitude != null &&
                    selectedLongitude != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TaskersList(
                        category: widget.category,
                        location: _locationController.text,
                        userLatitude: selectedLatitude!,
                        userLongitude: selectedLongitude!,
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please select a location from suggestions')),
                  );
                }
              },
              child: Text('Find Taskers'),
            ),
          ],
        ),
      ),
    );
  }
}
