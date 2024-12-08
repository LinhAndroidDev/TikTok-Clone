import 'dart:math';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

String convertNumberToString(int quantity) {
  String result = '';
  if (quantity >= 10000) {
    result = '${((quantity / 1000) * 10).round() / 10}K';
  } else {
    result = quantity.toString();
  }

  return result;
}

/// Determine the current position of the device.
///
/// When the location services are not enabled or permissions
/// are denied the `Future` will return an error.
Future<Position> determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}

/// This function use Haversine formula to calculate the distance between two points.
double calculateDistance({required double lat1, required double lon1, required double lat2, required double lon2}) {
  const double R = 6371; // Bán kính trái đất (km)
  double lat1Rad = lat1 * pi / 180;
  double lat2Rad = lat2 * pi / 180;
  double deltaLat = (lat2 - lat1) * pi / 180;
  double deltaLon = (lon2 - lon1) * pi / 180;

  double a = sin(deltaLat / 2) * sin(deltaLat / 2) +
      cos(lat1Rad) * cos(lat2Rad) *
          sin(deltaLon / 2) * sin(deltaLon / 2);
  double c = 2 * atan2(sqrt(a), sqrt(1 - a));

  return R * c; // Khoảng cách tính bằng km
}

/// Convert distance between 2 points to string
String convertDistanceToString(double distance) {
  if (distance < 1) {
    return '${(distance * 1000).round()}m';
  } else {
    return '${(distance * 10).round() / 10}km';
  }
}

/// Function to sum the distances of a list of coordinates
double calculateTotalDistance({required List<LatLng> routePoints, required LatLng myLocation, required LatLng destination}) {
  double totalDistance = 0;

  var point = routePoints[0];
  totalDistance = calculateDistance(lat1: myLocation.latitude, lon1: myLocation.longitude, lat2: routePoints[0].latitude, lon2: routePoints[0].longitude);
  for (int i = 1; i < routePoints.length - 1; i++) {
    totalDistance += calculateDistance(
        lat1: point.latitude,
        lon1: point.longitude,
        lat2: routePoints[i].latitude,
        lon2: routePoints[i].longitude);
    point = routePoints[i];
  }

  totalDistance += calculateDistance(
      lat1: routePoints[routePoints.length - 1].latitude,
      lon1: routePoints[routePoints.length - 1].longitude,
      lat2: destination.latitude,
      lon2: destination.longitude);
  return totalDistance;
}
