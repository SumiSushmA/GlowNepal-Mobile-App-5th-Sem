import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:glownepal_mobile_app_5th_sem/features/auth/presentation/view/register_view.dart';
import 'package:glownepal_mobile_app_5th_sem/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockRegisterBloc extends Mock implements RegisterBloc {}

void main() {
  late MockRegisterBloc mockRegisterBloc;

  setUp(() {
    mockRegisterBloc = MockRegisterBloc();
    when(() => mockRegisterBloc.stream).thenAnswer(
      (_) => Stream.value(
        const RegisterState(
          isLoading: false,
          isSuccess: false,
          imageName: null,
          isImageUploaded: false,
        ),
      ),
    );
    when(() => mockRegisterBloc.state).thenReturn(
      const RegisterState(
        isLoading: false,
        isSuccess: false,
        imageName: null,
        isImageUploaded: false,
      ),
    );
  });

  Widget createTestWidget() {
    return MaterialApp(
      home: BlocProvider<RegisterBloc>.value(
        value: mockRegisterBloc,
        child: const RegisterView(),
      ),
    );
  }

  testWidgets('Should display Register title', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget());
    await tester.pumpAndSettle();

    expect(
      find.descendant(of: find.byType(AppBar), matching: find.text('Register')),
      findsOneWidget,
    );
  });

  testWidgets('Should display all input fields', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget());
    await tester.pumpAndSettle();

    final labels = [
      'Full Name',
      'Phone No',
      'Email',
      'Address',
      'Date of Birth',
      'Gender',
      'UserName',
      'Password'
    ];

    for (var label in labels) {
      expect(find.text(label), findsOneWidget);
    }
  });

  testWidgets('Should display register button', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget());
    await tester.pumpAndSettle();

    expect(find.widgetWithText(ElevatedButton, 'Sign Up Now!'), findsOneWidget);
  });

  testWidgets('Should show Snackbar if required fields are empty',
      (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget());
    await tester.pumpAndSettle();

    // Find the Register button
    final registerButton = find.widgetWithText(ElevatedButton, 'Sign Up Now!');

    // Tap on the Register button
    await tester.ensureVisible(registerButton);
    await tester.tap(registerButton);
    await tester.pump();

    // Verify that the Snackbar appears
    expect(find.textContaining('Enter'), findsWidgets);
  });
}
