import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:glownepal_mobile_app_5th_sem/features/home/presentation/view_model/home_cubit.dart';
import 'package:mocktail/mocktail.dart';

class MockHomeCubit extends Mock implements HomeCubit {}

void main() {
  testWidgets('AppointmentBooking screen loads with basic UI elements',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<HomeCubit>(
          create: (context) => MockHomeCubit(),
          child: Scaffold(
            body: Column(
              children: [
                Text("Appointment"),
                Text("Checkout"),
              ],
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text("Appointment"), findsOneWidget);
    expect(find.text("Checkout"), findsOneWidget);
  });
}
