import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit()
      : super(
          OnboardingState(
            currentIndex: 0,
            isLastPage: false,
          ),
        );

  final PageController pageController = PageController();

  void onPageChanged(int index, int totalPages) {
    emit(
      OnboardingState(
        currentIndex: index,
        isLastPage: index == totalPages - 1,
      ),
    );
  }

  void nextPage() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void skipToLastPage(int totalPages) {
    pageController.jumpToPage(totalPages - 1);
  }

  void navigateToLogin(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/login');
  }
}
