import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlong2/latlong.dart';
import 'package:toursl/models/tourist_city.dart';

import 'map_event.dart';
import 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc() : super(MapState.initial()) {
    on<LoadGeoJsonEvent>(_onLoadGeoJson);
    on<SelectDistrictEvent>(_onSelectDistrict);
  }

  Future<void> _onLoadGeoJson(LoadGeoJsonEvent event, Emitter<MapState> emit) async {
    final data = await rootBundle.loadString('assets/gadm41_LKA_1.json');
    final geoJson = json.decode(data);
    final features = geoJson['features'] as List;

    final Map<String, List<List<LatLng>>> districtCoords = {};

    for (var feature in features) {
      final name = feature['properties']['NAME_1'];
      final geometry = feature['geometry'];
      final type = geometry['type'];
      final coords = geometry['coordinates'];

      List<List<LatLng>> polygons = [];

      if (type == 'MultiPolygon') {
        for (var poly in coords) {
          final latlngs = poly[0].map<LatLng>((c) => LatLng(c[1], c[0])).toList();
          polygons.add(latlngs);
        }
      } else if (type == 'Polygon') {
        final latlngs = coords[0].map<LatLng>((c) => LatLng(c[1], c[0])).toList();
        polygons.add(latlngs);
      }

      districtCoords[name] = polygons;
    }

    emit(state.copyWith(districtCoords: districtCoords, selectedDistrict: null));
  }

  Future<void> _onSelectDistrict(
    SelectDistrictEvent event, Emitter<MapState> emit) async {
  final jsonString = await rootBundle.loadString('assets/sri_lanka_travel_data_full.json');
  final data = json.decode(jsonString);

  final districtData = (data['SriLanka']['districts'] as List)
      .firstWhere((d) => d['name'] == event.district, orElse: () => null);

  final List<TouristCity> cities = districtData != null
      ? (districtData['cities'] as List)
          .map((c) => TouristCity.fromJson(c))
          .toList()
      : [];

  emit(state.copyWith(
    selectedDistrict: event.district,
    districtCities: cities,
  ));
}

}
