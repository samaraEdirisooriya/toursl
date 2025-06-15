import 'package:flutter/material.dart';

class Mapui extends StatefulWidget {
  const Mapui({super.key});

  @override
  State<Mapui> createState() => _MapuiState();
}

class _MapuiState extends State<Mapui> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Image.asset(
        'assets/sriLankaHigh.svg',
        width: 300, // Adjust as needed
        height: 400, // Adjust as needed
        fit: BoxFit.contain,
      ),
    );
  }
}
