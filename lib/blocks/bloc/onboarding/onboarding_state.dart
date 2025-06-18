part of 'onboarding_bloc.dart';

@immutable
sealed class OnboardingState {}

final class OnboardingInitial extends OnboardingState {}


class ShowOnboarding extends OnboardingState {}

class OnboardingCompleted extends OnboardingState {}