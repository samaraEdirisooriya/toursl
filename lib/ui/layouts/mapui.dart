import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';



class SriLankaDistrictMap extends StatefulWidget {
  const SriLankaDistrictMap({super.key});

  @override
  State<SriLankaDistrictMap> createState() => _SriLankaDistrictMapState();
}

class _SriLankaDistrictMapState extends State<SriLankaDistrictMap> {
  Map<String, List<List<LatLng>>> districtCoords = {};
  String? selectedDistrict;

  @override
  void initState() {
    super.initState();
    loadGeoJson();
  }

  Future<void> loadGeoJson() async {
    final data = await rootBundle.loadString('assets/gadm41_LKA_1.json');
    final geoJson = json.decode(data);

    final features = geoJson['features'] as List;

    for (var feature in features) {
      final name = feature['properties']['NAME_1'];
      final geometry = feature['geometry'];
      final type = geometry['type'];
      final coords = geometry['coordinates'];

      List<List<LatLng>> polygons = [];

      if (type == 'MultiPolygon') {
        for (var poly in coords) {
          final latlngs =
              poly[0].map<LatLng>((c) => LatLng(c[1], c[0])).toList();
          polygons.add(latlngs);
        }
      } else if (type == 'Polygon') {
        final latlngs =
            coords[0].map<LatLng>((c) => LatLng(c[1], c[0])).toList();
        polygons.add(latlngs);
      }

      districtCoords[name] = polygons;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final allPolygons =
        districtCoords.entries.expand((entry) {
          final isSelected = selectedDistrict == entry.key;
          return entry.value.map(
            (polyPart) => Polygon(
              points: polyPart,
              color:
                  isSelected
                      ? const Color.fromARGB(169, 244, 67, 54).withOpacity(0.9)
                      : const Color.fromARGB(82, 255, 255, 255).withOpacity(0.3),
              borderColor: const Color.fromARGB(255, 88, 88, 88),
              borderStrokeWidth: 1,
              isFilled: true,
            ),
          );
        }).toList();

    return Stack(
      children: [
        FlutterMap(
          options: MapOptions(
            center: LatLng(7.8731, 80.7718),
            zoom: 7.2,
            onTap: (_, latlng) {
              String? tappedDistrict;
              for (var entry in districtCoords.entries) {
                for (var poly in entry.value) {
                  if (_pointInPolygon(latlng, poly)) {
                    tappedDistrict = entry.key;
                    break;
                  }
                }
                if (tappedDistrict != null) break;
              }
              setState(() {
                selectedDistrict = tappedDistrict;
              });
            },
          ),
          children: [PolygonLayer(polygons: allPolygons)],
        ),
        if (selectedDistrict != null)
          Positioned(
            bottom: 20,
            left: 20,
            child: Container(
              padding: const EdgeInsets.all(8),
              color: Colors.black87,
              child: Text(
                "Selected: $selectedDistrict",
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
      ],
    );
  }

  // Ray-casting point-in-polygon algorithm
  bool _pointInPolygon(LatLng point, List<LatLng> polygon) {
    int intersectCount = 0;
    for (int j = 0; j < polygon.length - 1; j++) {
      LatLng a = polygon[j];
      LatLng b = polygon[j + 1];
      if (((a.latitude > point.latitude) != (b.latitude > point.latitude)) &&
          (point.longitude <
              (b.longitude - a.longitude) *
                      (point.latitude - a.latitude) /
                      (b.latitude - a.latitude) +
                  a.longitude)) {
        intersectCount++;
      }
    }
    return (intersectCount % 2) == 1;
  }
}
