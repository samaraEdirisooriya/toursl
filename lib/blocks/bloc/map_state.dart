import 'package:latlong2/latlong.dart';
import 'package:toursl/models/tourist_city.dart';

class MapState {
  final Map<String, List<List<LatLng>>> districtCoords;
  final String? selectedDistrict;
  final List<TouristCity> districtCities;


  MapState({
    required this.districtCoords,
    required this.selectedDistrict,
    required this.districtCities,
  });

  MapState copyWith({
   Map<String, List<List<LatLng>>>? districtCoords,
  String? selectedDistrict,
  List<TouristCity>? districtCities,
}) {
  return MapState(
    districtCoords: districtCoords ?? this.districtCoords,
    selectedDistrict: selectedDistrict ?? this.selectedDistrict,
    districtCities: districtCities ?? this.districtCities,
  );
  }

  factory MapState.initial() {
     return MapState(
    districtCoords: {},
    selectedDistrict: null,
    districtCities: [],
  );
  }
}
