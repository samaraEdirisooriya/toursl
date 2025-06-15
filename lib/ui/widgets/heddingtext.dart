import 'package:flutter/material.dart';
import 'package:toursl/ui/colors/colors.dart';

class HeadingText extends StatelessWidget {
  const HeadingText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome to",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.headingText,
            fontFamily: 'Roboto',
            height: 0.8, // Reduce line height
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(top: 2.0),
          child: Text(
            "Sri lanka",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: AppColors.headingText,
              fontFamily: 'Roboto',
              height: 0.8, // Reduce line height
            ),
          ),
        ),
      ],
    );
  }
}
