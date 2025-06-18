import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:toursl/blocks/map/map_bloc.dart';
import 'package:toursl/blocks/map/map_event.dart';
import 'package:toursl/blocks/map/map_state.dart';
import 'package:toursl/ui/colors/colors.dart';

class SriLankaDistrictMap extends StatelessWidget {
  const SriLankaDistrictMap({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapBloc, MapState>(
      builder: (context, state) {
        return const MapView();
      },
    );
  }
}
class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocBuilder<MapBloc, MapState>(
        builder: (context, state) {
          final allPolygons = state.districtCoords.entries.expand((entry) {
            final isSelected = state.selectedDistrict == entry.key;
            return entry.value.map((polyPart) => Polygon(
              points: polyPart,
              color: isSelected
                  ? AppColors.districtSelectingColor
                  : AppColors.srilankanMapBackground,
              borderColor: AppColors.srilankanMapBorder,
              borderStrokeWidth: 1,
              isFilled: true,
            ));
          }).toList();

          return Stack(
            children: [
              FlutterMap(
                options: MapOptions(
                  center: LatLng(7.8731, 80.7718),
                  zoom: 6.9,
                  interactiveFlags: InteractiveFlag.none,
                  onTap: (_, latlng) {
                    for (var entry in state.districtCoords.entries) {
                      for (var poly in entry.value) {
                        if (_pointInPolygon(latlng, poly)) {
                          context.read<MapBloc>().add(SelectDistrictEvent(entry.key));
                          return;
                        }
                      }
                    }
                  },
                ),
                children: [
                  
                  PolygonLayer(polygons: allPolygons)],
              ),
              
            ],
          );
        },
      ),
    );
  }

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
