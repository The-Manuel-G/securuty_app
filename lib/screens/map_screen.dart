// lib/screens/map_screen.dart
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatelessWidget {
  final Set<Marker> markers;

  MapScreen(this.markers);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mapa de Incidentes')),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(0, 0),  // Coordenadas iniciales del mapa
          zoom: 10,
        ),
        markers: markers,
      ),
    );
  }
}
