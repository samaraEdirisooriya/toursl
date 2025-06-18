import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toursl/blocks/map/map_bloc.dart';
import 'package:toursl/blocks/map/map_event.dart';
import 'package:toursl/blocks/map/map_state.dart';
import 'package:toursl/ui/layouts/mapui.dart';
import 'package:toursl/ui/widgets/bground_img.dart';
import 'package:toursl/ui/widgets/heddingtext.dart';
import 'package:toursl/ui/widgets/homelist.dart';
import 'package:toursl/ui/widgets/selectdistrict.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
@override
void initState() {
  super.initState();
  context.read<MapBloc>().add(LoadGeoJsonEvent());
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          BgroundImg(),

          SingleChildScrollView(
            child: Stack(
              children: [
                Container(

                  width: MediaQuery.of(context).size.width,

                  height: 500,
                  child:  Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: SelectedDistrictWidget(),
                    )
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 80, left: 20),
                      child: HeadingText(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Container(
                        width: 200,
                        height: 400,
                        child: const SriLankaDistrictMap(),
                      ),
                    ),
                    HomeList(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
