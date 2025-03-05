import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:glownepal_mobile_app_5th_sem/features/home/presentation/view/contact_us_view.dart';

void main() {
  testWidgets('ContactUsView renders basic UI elements',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ContactUsView(),
      ),
    );

    await tester.pumpAndSettle();

    // Check if essential text elements exist
    expect(find.text("Contact Us"), findsOneWidget);
    expect(find.text("Our Office"), findsOneWidget);
    expect(
        find.text(
            "GlowNepal Beauty & Salon\n123 Main Street, Kathmandu, Nepal"),
        findsOneWidget);
    expect(find.text("+977 9812345678"), findsOneWidget);
    expect(find.text("support@glownepal.com"), findsOneWidget);
    expect(find.text("Careers at GlowNepal"), findsOneWidget);
    expect(find.text("Join our team and help redefine beauty and wellness."),
        findsOneWidget);
    expect(find.text("Explore Jobs"), findsOneWidget);
  });

  testWidgets('ContactUsView contains an Explore Jobs button',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ContactUsView(),
      ),
    );

    await tester.pumpAndSettle();

    // Find the button
    expect(find.widgetWithText(ElevatedButton, "Explore Jobs"), findsOneWidget);

    // Tap the button
    await tester.tap(find.widgetWithText(ElevatedButton, "Explore Jobs"));
    await tester.pump();
  });
}
