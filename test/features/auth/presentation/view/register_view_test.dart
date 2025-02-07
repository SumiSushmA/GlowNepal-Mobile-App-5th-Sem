import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:glownepal_mobile_app_5th_sem/features/auth/presentation/view/register_view.dart';
import 'package:glownepal_mobile_app_5th_sem/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:mocktail/mocktail.dart';

import 'fake.register.dart';
import 'register.mock.dart';

void main() {
  late MockRegisterBloc mockRegisterBloc;

  setUpAll(() {
    registerFallbackValue(FakeRegisterStudent());
  });

  setUp(() {
    mockRegisterBloc = MockRegisterBloc();

    when(() => mockRegisterBloc.stream).thenAnswer(
      (_) => Stream.value(const RegisterState(
          isLoading: false,
          isSuccess: false,
          imageName: null,
          isImageUploaded: false)),
    );

    when(() => mockRegisterBloc.state).thenReturn(const RegisterState(
        isLoading: false,
        isSuccess: false,
        imageName: 'test_image.png',
        isImageUploaded: true));

    when(() => mockRegisterBloc.add(any(that: isA<RegisterStudent>())))
        .thenReturn(null);
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
      expect(find.widgetWithText(TextFormField, label), findsOneWidget);
    }
  });

  testWidgets('Should display register button', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget());
    await tester.pumpAndSettle();

    expect(find.widgetWithText(ElevatedButton, 'Register'), findsOneWidget);
  });

  testWidgets('Should show Snackbar if required fields are empty',
      (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget());
    await tester.pumpAndSettle();

    final registerButton = find.widgetWithText(ElevatedButton, 'Register');
    await tester.ensureVisible(registerButton);
    await tester.tap(registerButton);
    await tester.pumpAndSettle();

    expect(find.textContaining('Enter'), findsWidgets);
  });
}
