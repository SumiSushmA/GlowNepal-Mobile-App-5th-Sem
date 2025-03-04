import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:glownepal_mobile_app_5th_sem/features/home/presentation/view/bottom_view/about_view.dart';
import 'package:glownepal_mobile_app_5th_sem/features/home/presentation/view/bottom_view/booking_view.dart';
import 'package:glownepal_mobile_app_5th_sem/features/home/presentation/view/bottom_view/profile_view.dart';
import 'package:glownepal_mobile_app_5th_sem/features/home/presentation/view/home_view.dart';

class HomeState extends Equatable {
  final int selectedIndex;
  final List<Widget> views;

  const HomeState({required this.selectedIndex, required this.views});

  factory HomeState.initial() {
    return HomeState(
      selectedIndex: 0,
      views: [
        HomeView(),
        const BookingView(),
        const AboutView(),
        const ProfileView(),
      ],
    );
  }

  HomeState copyWith({int? selectedIndex}) {
    return HomeState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      views: views,
    );
  }

  @override
  List<Object> get props => [selectedIndex, views];
}
