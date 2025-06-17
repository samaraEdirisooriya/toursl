abstract class MapEvent {}

class LoadGeoJsonEvent extends MapEvent {}

class SelectDistrictEvent extends MapEvent {
  final String district;
  SelectDistrictEvent(this.district);
}
