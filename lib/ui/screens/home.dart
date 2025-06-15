import 'package:flutter/material.dart';
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
        alignment: Alignment.topLeft,
        children: [
          BgroundImg(),
         
          SingleChildScrollView(
            
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 80, left: 20),
                  child: HeadingText(),
                ),
                Container(
                  height: 400,
                  width: 400,
                  child: DistrictMapPage(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
