import 'package:flutter/material.dart';
import 'package:toursl/ui/widgets/bground_img.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Stack(

      children: [
        BgroundImg(),
      ],
    ));
  }
}
