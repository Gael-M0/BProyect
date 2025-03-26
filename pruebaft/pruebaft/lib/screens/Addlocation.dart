import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:geocoding/geocoding.dart';

class AddLocationScreen extends StatefulWidget {
  @override
  _AddLocationScreenState createState() => _AddLocationScreenState();
}

class _AddLocationScreenState extends State<AddLocationScreen> {
  LatLng? _currentLocation;
  String? _address;
  String? _currentDate; // Variable para almacenar la fecha actual

  Future<void> _getLocation() async {
    try {
      // Obtener la ubicación actual
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // Convertir la ubicación en una dirección (geocodificación inversa)
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      // Obtener la fecha actual
      String currentDate = DateTime.now().toLocal().toString().split(' ')[0];

      setState(() {
        _currentLocation = LatLng(position.latitude, position.longitude);
        _address = placemarks.isNotEmpty
            ? "${placemarks.first.street}, ${placemarks.first.locality}, ${placemarks.first.country}"
            : "Dirección no encontrada";
        _currentDate = currentDate; // Guardar la fecha actual
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error al obtener la ubicación: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Acceder a Ubicación")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton.icon(
              onPressed: _getLocation,
              icon: const Icon(Icons.location_on),
              label: const Text("Acceder a Ubicación"),
            ),
            const SizedBox(height: 20),
            if (_address != null)
              Text(
                "Dirección: $_address",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            const SizedBox(height: 10),
            if (_currentDate != null)
              Text(
                "Fecha: $_currentDate",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            const SizedBox(height: 20),
            if (_currentLocation != null)
              Expanded(
                child: FlutterMap(
                  options: MapOptions(
                    center: _currentLocation,
                    zoom: 18.0, // Cambiar el nivel de zoom a un valor más alto
                  ),
                  children: [
                    TileLayer(
                      urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                      subdomains: const ['a', 'b', 'c'],
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          width: 80.0,
                          height: 80.0,
                          point: _currentLocation!,
                          builder: (ctx) => const Icon(
                            Icons.location_on,
                            color: Colors.red,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}