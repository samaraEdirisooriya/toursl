import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(OnboardingInitial()) {
    on<OnboardingEvent>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      final seen = prefs.getBool('onboarding_seen') ?? false;

      if (seen) {
        emit(OnboardingCompleted());
      } else {
        emit(ShowOnboarding());
      }
    });

    on<CompleteOnboarding>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('onboarding_seen', true);
      emit(OnboardingCompleted());
    });
  }
}
