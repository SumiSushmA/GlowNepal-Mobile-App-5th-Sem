import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glownepal_mobile_app_5th_sem/app/di/di.dart';
import 'package:glownepal_mobile_app_5th_sem/features/auth/presentation/view/login_view.dart';
import 'package:glownepal_mobile_app_5th_sem/features/auth/presentation/view_model/login/login_bloc.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit(LoginBloc userLoginBloc)
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
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (_) => getIt<LoginBloc>(), // ✅ Fix: Provide UserLoginBloc
          child: LoginView(),
        ),
      ),
    );
  }
}
