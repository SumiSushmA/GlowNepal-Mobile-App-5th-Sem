import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:glownepal_mobile_app_5th_sem/features/home/presentation/view/bottom_view/about_view.dart';

void main() {
  testWidgets('AboutView UI test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: AboutView(),
      ),
    );

    // Verify app bar title
    expect(find.text('About Us'), findsOneWidget);

    // Verify presence of main content
    expect(find.textContaining("Welcome to GlowNepal"), findsOneWidget);
    expect(find.text("Our Vision"), findsOneWidget);
    expect(find.textContaining("Our vision at GlowNepal"), findsOneWidget);
    expect(find.text("WHY CHOOSE US"), findsOneWidget);

    // Verify hover cards are present
    expect(find.text("EFFICIENCY"), findsOneWidget);
    expect(find.text("CONVENIENCE"), findsOneWidget);
    expect(find.text("PERSONALIZATION"), findsOneWidget);

    // Verify hover card descriptions
    expect(
        find.textContaining(
            "Seamless online booking with instant appointment confirmation."),
        findsOneWidget);
    expect(
        find.textContaining(
            "Find top-rated beauty professionals near you and book appointments at your preferred time."),
        findsOneWidget);
    expect(
        find.textContaining(
            "Receive tailored beauty service recommendations based on your preferences."),
        findsOneWidget);
  });

  testWidgets('AboutView should scroll properly', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: AboutView(),
      ),
    );

    final scrollableFinder = find.byType(Scrollable);
    expect(scrollableFinder, findsOneWidget);

    await tester.fling(scrollableFinder, const Offset(0, -300), 1000);
    await tester.pumpAndSettle();

    expect(find.text("WHY CHOOSE US"), findsOneWidget);
  });

  testWidgets('Hover cards should be displayed correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: AboutView(),
      ),
    );

    expect(find.text("EFFICIENCY"), findsOneWidget);
    expect(find.text("CONVENIENCE"), findsOneWidget);
    expect(find.text("PERSONALIZATION"), findsOneWidget);
  });
}
