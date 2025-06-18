import 'package:flutter/material.dart';
import 'package:toursl/models/onboarddata.dart';


class OnboardPage extends StatelessWidget {
  final OnboardData data;

  const OnboardPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Column(
        children: [
          Image.asset(data.image, height: 300),
          const SizedBox(height: 40),
          Text(
            data.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF054D3B),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            data.description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF2C5E4F),
            ),
          ),
        ],
      ),
    );
  }
}
