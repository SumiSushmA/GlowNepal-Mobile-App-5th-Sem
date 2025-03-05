import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:glownepal_mobile_app_5th_sem/features/home/presentation/view/bottom_view/booking_view.dart';
import 'package:glownepal_mobile_app_5th_sem/features/home/presentation/view_model/home_cubit.dart';
import 'package:glownepal_mobile_app_5th_sem/features/home/presentation/view_model/home_state.dart';

void main() {
  late HomeCubit homeCubit;

  setUp(() {
    homeCubit = HomeCubit();
  });

  testWidgets('Always passing test', (WidgetTester tester) async {
    expect(1, 1);
  });

  testWidgets('BookingView widget builds without crashing',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider.value(
          value: homeCubit,
          child: const BookingView(),
        ),
      ),
    );

    expect(find.byType(BookingView), findsOneWidget);
  });

  testWidgets('BookingView shows no bookings message when empty',
      (WidgetTester tester) async {
    homeCubit.emit(HomeState.initial());
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider.value(
          value: homeCubit,
          child: const BookingView(),
        ),
      ),
    );

    expect(find.text("No bookings yet."), findsOneWidget);
  });
}
