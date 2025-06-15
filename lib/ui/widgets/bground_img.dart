import 'package:flutter/material.dart';
import 'package:toursl/ui/colors/colors.dart';
import 'package:toursl/ui/img/img.dart';

class BgroundImg extends StatelessWidget {
  const BgroundImg({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            AppAssets.background,
          ), 
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [

          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: double.infinity, 
              width: double.infinity,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors
                          .backgroundGradientTop, 
                      AppColors
                          .backgroundGradientBottom, 
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 60,
            left: 120,
            child: Container(
              width: 420,
              height: 420,
              child: Transform.rotate(
                angle: 1.9708, // 90 degrees in radians
                child: Image.asset(
                  'assets/line.png',
                  width: 120,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
