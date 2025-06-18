import 'package:flutter/material.dart';
import 'package:toursl/models/tourist_city.dart';

class SelectedDistrictCard extends StatelessWidget {
  final String districtName;
  final List<TouristCity> cities;

  const SelectedDistrictCard({
    super.key,
    required this.districtName,
    required this.cities,
  });

  @override
  Widget build(BuildContext context) {
    final firstImageUrl = cities.isNotEmpty ? cities.first.url : '';

    return (firstImageUrl.isNotEmpty)
        ? Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 3),
            shape: BoxShape.circle,
          ),
          child: ClipOval(
            child: Image.asset(
              "assets/sample.png",
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
        )
        : Container();
  }
}
