import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glownepal_mobile_app_5th_sem/features/home/presentation/view/bottom_view/about_view.dart';
import 'package:glownepal_mobile_app_5th_sem/features/home/presentation/view/bottom_view/booking_view.dart';
import 'package:glownepal_mobile_app_5th_sem/features/home/presentation/view/bottom_view/profile_view.dart';
import 'package:glownepal_mobile_app_5th_sem/features/home/presentation/view/home_view.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit()
      : super(HomeState(
          selectedIndex: 0,
          views: [
            HomeView(),
            const BookingView(),
            const AboutView(),
            const ProfileView(),
          ],
        ));

  void onTabTapped(int index) {
    emit(state.copyWith(selectedIndex: index));
  }
}
