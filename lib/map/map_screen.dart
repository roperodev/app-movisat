import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'map_provider.dart';

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mapProvider = Provider.of<MapProvider>(context);
    final MapController mapController = MapController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa con Marcadores Dinámicos'),
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: mapController, // Controlador del mapa
            options: MapOptions(
              center: LatLng(38.0031, -1.1446),
              zoom: 13.0,
              onTap: (tapPosition, point) {
                mapProvider.addMarker(point); // Añadir marcador al tocar el mapa
              },
            ),
            children: [
              TileLayer(
                urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c'],
              ),
              MarkerLayer(
                markers: mapProvider.markers.map((marker) {
                  return Marker(
                    point: marker,
                    builder: (ctx) => GestureDetector(
                      onLongPress: () {
                        mapProvider.removeMarker(marker); // Elimina el marcador
                      },
                      child: Icon(
                        Icons.location_on,
                        color: Colors.red,
                        size: 40.0,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: Column(
              children: [
                FloatingActionButton(
                  heroTag: "zoom_in",
                  onPressed: () {
                    mapController.move(
                      mapController.center,
                      mapController.zoom + 1, // Aumenta el zoom
                    );
                  },
                  child: Icon(Icons.zoom_in),
                ),
                SizedBox(height: 10),
                FloatingActionButton(
                  heroTag: "zoom_out",
                  onPressed: () {
                    mapController.move(
                      mapController.center,
                      mapController.zoom - 1, // Disminuye el zoom
                    );
                  },
                  child: Icon(Icons.zoom_out),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}