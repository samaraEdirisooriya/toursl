import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:toursl/models/tourist_city.dart';
import 'package:toursl/ui/colors/colors.dart';

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
    final firstImageUrl = cities.isNotEmpty && cities.first.url != null
        ? cities.first.url!
        : '';

    return firstImageUrl.isNotEmpty
        ? Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 3),
              boxShadow: [
                BoxShadow(
                  color: AppColors.backgroundGradientBottom,
                  blurRadius: 6,
                  offset: const Offset(2, 4),
                ),
              ],
            ),
            child: ClipOval(
              child: Image.network(
                firstImageUrl,
                fit: BoxFit.cover,
                width: 100,
                height: 100,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;

                  // Show circular container with progress indicator
                  return Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      
                    ),
                    child: const Center(
                      child: SizedBox(
                        width: 30,
                        height: 30,
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                          color: Colors.white, // Use your theme color
                        ),
                      ),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    "assets/sample.png",
                    fit: BoxFit.cover,
                    width: 100,
                    height: 100,
                  );
                },
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}
