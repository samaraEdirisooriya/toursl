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

    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8)],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (firstImageUrl.isNotEmpty)
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 3),
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: Image.network(
                  firstImageUrl,
                  width: 64,
                  height: 64,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(districtName,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                ...cities.map((c) => Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text(
                        "${c.name}: ${c.description}",
                        style: const TextStyle(fontSize: 13),
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
