import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_movisat/map/map_provider.dart';
import 'package:app_movisat/map/map_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MapProvider()..loadMarkers()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MapScreen(),
    );
  }
}