import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class DistrictMapPage extends StatefulWidget {
  @override
  _DistrictMapPageState createState() => _DistrictMapPageState();
}

class _DistrictMapPageState extends State<DistrictMapPage> {
  List<Polygon> districtPolygons = [];

  @override
  void initState() {
    super.initState();
    loadGeoJson();
  }

  Future<void> loadGeoJson() async {
    final String data = await rootBundle.loadString('assets/gadm41_LKA_1.json');
    final geoJson = json.decode(data);
    List features = geoJson['features'];

    List<Polygon> polygons = [];

    for (var feature in features) {
      final String districtName = feature['properties']['NAME_1'];
      final coordinates = feature['geometry']['coordinates'];
      final geometryType = feature['geometry']['type'];

      List polygonsData = [];

      if (geometryType == 'Polygon') {
        polygonsData = [coordinates[0]];
      } else if (geometryType == 'MultiPolygon') {
        polygonsData = coordinates[0];
      }

      for (var ring in polygonsData) {
        List<LatLng> latlngList =
            ring.map<LatLng>((point) {
              return LatLng(point[1], point[0]);
            }).toList();

        polygons.add(
          Polygon(
            points: latlngList,
            color:
                districtName == "Colombo"
                    ? Colors.white.withOpacity(0.8)
                    : Colors.transparent,
            borderStrokeWidth: 1.0,
            borderColor: Colors.black,
          ),
        );
      }
    }

    setState(() {
      districtPolygons = polygons;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(7.8731, 80.7718), // Center of Sri Lanka
        zoom: 7.0,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.toursl',
        ),
        PolygonLayer(polygons: districtPolygons),
      ],
    );
  }
}
