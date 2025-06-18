import 'package:flutter/material.dart';
import 'package:toursl/models/tourist_city.dart';

class BuildCard extends StatelessWidget {
  const BuildCard({super.key, required this.city});

  final TouristCity city;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      margin: const EdgeInsets.only(left: 16, bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white.withOpacity(0.95),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              child: Image.network(
                city.url,
                width: 90,
                height: 120,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  return const SizedBox(
                    width: 90,
                    height: 120,
                    child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
                  );
                },
                errorBuilder: (_, __, ___) => const Icon(Icons.broken_image, size: 90),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(city.name,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  Expanded(
                    child: Text(
                      city.description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 13, color: Colors.black87),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}