import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toursl/blocks/bloc/map_bloc.dart';
import 'package:toursl/blocks/bloc/map_state.dart';
import 'package:toursl/ui/layouts/selected_district_card.dart';

class SelectedDistrictWidget extends StatelessWidget {
  const SelectedDistrictWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocBuilder<MapBloc, MapState>(
        builder: (context, state) {
          if (state.selectedDistrict == null || state.districtCities.isEmpty) {
            return const Center(child: Text("No district selected."));
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SelectedDistrictCard(
              districtName: state.selectedDistrict!,
              cities: state.districtCities,
            ),
          );
        },
      ),
        Positioned(
            top: 60,
            left: 120,
            child: SizedBox(
              width: 420,
              height: 420,
              child: Transform.rotate(
                angle: 1.9708, // 90 degrees in radians
                child: Image.asset(
                  'assets/line.png',
                  width: 120,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
