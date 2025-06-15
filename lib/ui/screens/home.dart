import 'package:flutter/material.dart';
import 'package:toursl/ui/colors/colors.dart';
import 'package:toursl/ui/layouts/mapui.dart';
import 'package:toursl/ui/widgets/bground_img.dart';
import 'package:toursl/ui/widgets/heddingtext.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BgroundImg(),
         
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 80, left: 20),
                  child: HeadingText(),
                ),
                Mapui(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
