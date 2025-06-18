import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toursl/blocks/map/map_bloc.dart';
import 'package:toursl/blocks/map/map_state.dart';
import 'package:toursl/ui/layouts/buildcard.dart';
import 'package:toursl/ui/screens/CityDetailPage.dart';

class HomeList extends StatefulWidget {
  const HomeList({super.key});

  @override
  State<HomeList> createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapBloc, MapState>(
      builder: (context, state) {
        final cities = state.districtCities;

        if (state.selectedDistrict == null) {
          return const SizedBox.shrink(); // no district selected
        }

        if (cities.isEmpty) {
          return const Padding(
            padding: EdgeInsets.all(16),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        return SizedBox(
          height: 160,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: cities.length,
            itemBuilder: (context, index) {
              final city = cities[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CityDetailPage(city: city),
                    ),
                  );
                },
                child: Hero(
                 tag: city.name,
                  child: BuildCard(city: city),
                ),
              );
            },
          ),
        );
      },
    );
  }
  
}
