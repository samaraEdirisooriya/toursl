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
          
        ],
      ),
    );
  }
}
