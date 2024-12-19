import 'package:flutter_test/flutter_test.dart';
import 'package:latlong2/latlong.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:app_movisat/database_helper.dart';
import 'package:app_movisat/map/map_provider.dart';

void main() {
  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi; // Inicializa SQLite para pruebas
  });

  group('MapProvider Tests', () {
    late MapProvider mapProvider;

    setUp(() async {
      mapProvider = MapProvider();
      await DatabaseHelper.instance.database; // Inicializa la base de datos
    });

    test('Añadir marcador', () async {
      final initialMarkers = mapProvider.markers.length;
      await mapProvider.addMarker(LatLng(37.7749, -122.4194));
      expect(mapProvider.markers.length, initialMarkers + 1);
    });

    test('Eliminar marcador', () async {
      final marker = LatLng(37.7749, -122.4194);
      await mapProvider.addMarker(marker);
      final initialMarkers = mapProvider.markers.length;

      await mapProvider.removeMarker(marker);
      expect(mapProvider.markers.length, initialMarkers - 1);
    });

    test('Cargar marcadores desde la base de datos', () async {
      await mapProvider.addMarker(LatLng(37.7749, -122.4194));
      await mapProvider.loadMarkers();
      expect(mapProvider.markers.isNotEmpty, true);
    });
  });
}
