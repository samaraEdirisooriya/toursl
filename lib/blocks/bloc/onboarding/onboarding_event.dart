part of 'onboarding_bloc.dart';

@immutable
sealed class OnboardingEvent {}

class CheckOnboardingStatus extends OnboardingEvent {}

class CompleteOnboarding extends OnboardingEvent {}
