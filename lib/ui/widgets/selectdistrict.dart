import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toursl/blocks/bloc/map_bloc.dart';
import 'package:toursl/blocks/bloc/map_state.dart';
import 'package:toursl/ui/layouts/selected_district_card.dart';

class SelectedDistrictWidget extends StatelessWidget {
  const SelectedDistrictWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 600,
      child: Stack(
        children: [
          // Line image
          Positioned(
            top: 60,
            left: 120,
            child: SizedBox(
              width: 420,
              height: 420,
              child: Transform.rotate(
                angle: 1.9708,
                child: Image.asset(
                  'assets/line.png',
                  width: 120,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),

          // Use BlocBuilder inside Stack but return Positioned
          BlocBuilder<MapBloc, MapState>(
            builder: (context, state) {
              if (state.selectedDistrict == null || state.districtCities.isEmpty) {
                return const Positioned(
                  top: 250,
                  right: 100,
                  child: Text(
                    'Select a district',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }

              return Stack(
                children: [
                  Positioned(
                    top: 250,
                    right: 80,
                    child: SelectedDistrictCard(
                      districtName: state.selectedDistrict!,
                      cities: state.districtCities,
                    ),
                  ),
                  Positioned(
                    top: 210,
                    right: 150,
                    child: Text(
                      state.selectedDistrict!,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
