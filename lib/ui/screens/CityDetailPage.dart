import 'package:flutter/material.dart';
import 'package:toursl/models/tourist_city.dart';

class CityDetailPage extends StatelessWidget {
  final TouristCity city;

  const CityDetailPage({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F0),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 320,
            pinned: true,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.white.withOpacity(0.85),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black87),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: city.name,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  child: Image.network(
                    city.url ?? 'https://via.placeholder.com/600x400',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    loadingBuilder: (context, child, progress) {
                      if (progress == null) return child;
                      return Container(
                        alignment: Alignment.center,
                        color: Colors.black12,
                        child: const CircularProgressIndicator(
                          color: Color(0xFFE88300),
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.black12,
                        alignment: Alignment.center,
                        child: const Icon(Icons.broken_image, size: 80, color: Colors.grey),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),

          // Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    city.name,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF8B2500),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    width: 50,
                    height: 4,
                    color: const Color(0xFFE88300),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    city.description,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.6,
                      color: Color(0xFF3E3E3E),
                    ),
                  ),
                  const SizedBox(height: 30),
                  if (city.url != null)
                    Center(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // Launch URL here using url_launcher
                        },
                        icon: const Icon(Icons.explore),
                        label: const Text("Explore More"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE88300),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
