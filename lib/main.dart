import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toursl/blocks/bloc/onboarding/onboarding_bloc.dart';
import 'package:toursl/blocks/map/map_bloc.dart';
import 'package:toursl/blocks/map/map_event.dart';
import 'package:toursl/ui/screens/home.dart';
import 'package:toursl/ui/screens/onboardingscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MapBloc>(create: (context) => MapBloc()),
        BlocProvider<OnboardingBloc>(
          create: (context) => OnboardingBloc()..add(CheckOnboardingStatus()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<OnboardingBloc, OnboardingState>(
          builder: (context, state) {
            if (state is ShowOnboarding) {
              return const OnboardingScreen();
            } else if (state is OnboardingCompleted) {
              return const Home();
            }
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          },
        ),
      ),
    );
  }
}
