import 'package:flutter/material.dart';

class BgroundImg extends StatelessWidget {
  const BgroundImg({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bground.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // Gradient overlay at the top
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: 200, // Adjust height as needed
              width: double.infinity,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black54, // Top color (semi-transparent black)
                      Colors.transparent, // Bottom color (fully transparent)
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Add any additional widgets here if needed
        ],
      ),
    );
  }
}
