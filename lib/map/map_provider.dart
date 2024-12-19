import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import '../database_helper.dart';

class MapProvider with ChangeNotifier {
  List<LatLng> _markers = [];
  List<int> _markerIds = []; // IDs de la base de datos

  List<LatLng> get markers => _markers;

  Future<void> loadMarkers() async {
    final data = await DatabaseHelper.instance.fetchMarkers();
    _markers = data
        .map((row) => LatLng(row['latitude'], row['longitude']))
        .toList();
    _markerIds = data.map((row) => row['id'] as int).toList();
    notifyListeners();
  }

  Future<void> addMarker(LatLng point) async {
    final id = await DatabaseHelper.instance.insertMarker(point.latitude, point.longitude);
    _markers.add(point);
    _markerIds.add(id);
    notifyListeners();
  }

  Future<void> removeMarker(LatLng point) async {
    final index = _markers.indexOf(point);
    if (index != -1) {
      final id = _markerIds[index];
      await DatabaseHelper.instance.deleteMarker(id);
      _markers.removeAt(index);
      _markerIds.removeAt(index);
      notifyListeners();
    }
  }
}