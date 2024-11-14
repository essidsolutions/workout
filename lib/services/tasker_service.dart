// services/tasker_service.dart
import 'package:geolocator/geolocator.dart';
import '../models/tasker.dart';

class TaskerService {
  static Future<List<Tasker>> getTaskersForLocation(double userLatitude, double userLongitude) async {
    final List<Tasker> allTaskers = [
      Tasker(name: 'Luis Costa', experience: 5, rate: 20.0, latitude: 38.7169, longitude: -9.1393),
      Tasker(name: 'Maria Silva', experience: 3, rate: 18.0, latitude: 38.7110, longitude: -9.1392),
      Tasker(name: 'João Santos', experience: 8, rate: 25.0, latitude: 38.7262, longitude: -9.1511),
      Tasker(name: 'Pierre Dupont', experience: 4, rate: 22.0, latitude: 48.8566, longitude: 2.3522),
      Tasker(name: 'Sophie Martin', experience: 2, rate: 19.0, latitude: 48.8606, longitude: 2.3376),
      Tasker(name: 'Jean-Luc Petit', experience: 6, rate: 27.0, latitude: 48.8534, longitude: 2.3488),
    ];

    double radiusKm = 50.0;

    final nearbyTaskers = allTaskers.where((tasker) {
      double distanceInMeters = Geolocator.distanceBetween(
        userLatitude, userLongitude,
        tasker.latitude, tasker.longitude,
      );
      return distanceInMeters <= radiusKm * 1000;
    }).toList();

    return nearbyTaskers;
  }
}
