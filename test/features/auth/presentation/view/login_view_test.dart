import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:glownepal_mobile_app_5th_sem/features/auth/presentation/view/login_view.dart';
import 'package:glownepal_mobile_app_5th_sem/features/auth/presentation/view_model/login/login_bloc.dart';

import 'login.mock.dart';

void main() {
  late MockLoginBloc mockLoginBloc;

  setUp(() {
    mockLoginBloc = MockLoginBloc();
  });

  Widget createTestWidget() {
    return BlocProvider<LoginBloc>.value(
      value: mockLoginBloc,
      child: MaterialApp(
        home: LoginView(),
      ),
    );
  }

  testWidgets('Should have a title "Login"', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget());

    // Finder for the login title text
    Finder titleFinder = find.text('Login').first;

    // Debugging print
    debugPrint('Title found: ${titleFinder.evaluate().isNotEmpty}');

    // Verify the title exists in the widget tree
    expect(titleFinder, findsOneWidget);
  });

  testWidgets('Should find username and password text fields',
      (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget());

    // Find the username text field by key
    Finder usernameField = find.byKey(const ValueKey('username'));
    expect(usernameField, findsOneWidget);

    // Find the password text field by key
    Finder passwordField = find.byKey(const ValueKey('password'));
    expect(passwordField, findsOneWidget);
  });

  testWidgets('Should find login and register buttons',
      (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget());
    await tester.pumpAndSettle(); // Ensure UI is fully rendered

    // Debugging output to check widget tree
    debugPrint('Widgets in tree:');
    for (var widget in tester.allWidgets) {
      debugPrint(widget.toString());
    }

    // Find the Login button using widgetWithText
    Finder loginButton = find.widgetWithText(ElevatedButton, 'Login');
    expect(loginButton, findsOneWidget, reason: 'Login button is missing!');

    // Find the Register button using key
    Finder registerButton = find.byKey(const ValueKey('registerButton'));
    expect(registerButton, findsOneWidget,
        reason: 'Register button is missing!');
  });
}
