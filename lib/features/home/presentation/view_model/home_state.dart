import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:glownepal_mobile_app_5th_sem/features/home/presentation/view/bottom_view/about_view.dart';
import 'package:glownepal_mobile_app_5th_sem/features/home/presentation/view/bottom_view/booking_view.dart';
import 'package:glownepal_mobile_app_5th_sem/features/home/presentation/view/bottom_view/profile_view.dart';
import 'package:glownepal_mobile_app_5th_sem/features/home/presentation/view/home_view.dart';

class HomeState extends Equatable {
  final int selectedIndex;
  final List<Map<String, dynamic>> bookings; // Stores booking records
  final List<Widget> views; // List of views

  const HomeState({
    required this.selectedIndex,
    required this.bookings,
    required this.views,
  });

  /// **Initial State**
  factory HomeState.initial() {
    return HomeState(
      selectedIndex: 0,
      bookings: [],
      views: [
        HomeView(),
        const BookingView(), // Do not pass bookings explicitly
        const AboutView(),
        const ProfileView(),
      ],
    );
  }

  /// **Copy with updated values**
  HomeState copyWith(
      {int? selectedIndex, List<Map<String, dynamic>>? bookings}) {
    return HomeState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      bookings: bookings ?? this.bookings,
      views: [
        HomeView(),
        const BookingView(), // Keep BookingView static
        const AboutView(),
        const ProfileView(),
      ],
    );
  }

  @override
  List<Object> get props => [selectedIndex, bookings];
}
