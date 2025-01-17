import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glownepal_mobile_app_5th_sem/app/di/di.dart';
import 'package:glownepal_mobile_app_5th_sem/features/authentication/presentation/view/login/user_login_screen_view.dart';
import 'package:glownepal_mobile_app_5th_sem/features/authentication/presentation/view_model/login/user_login_bloc.dart';
import 'package:glownepal_mobile_app_5th_sem/features/home/presentation/view_model/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());

  void onTabTapped(int index) {
    emit(state.copyWith(selectedIndex: index));
  }

  void logout(BuildContext context) {
    // Wait for 2 seconds
    Future.delayed(const Duration(seconds: 2), () async {
      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider.value(
              value: getIt<UserLoginBloc>(),
              child: UserLoginScreenView(),
            ),
          ),
        );
      }
    });
  }
}
