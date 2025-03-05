import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:glownepal_mobile_app_5th_sem/features/auth/presentation/view/login_view.dart';
import 'package:glownepal_mobile_app_5th_sem/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:mocktail/mocktail.dart';

// ✅ Mocking LoginBloc & BuildContext
class MockLoginBloc extends MockBloc<LoginEvent, LoginState>
    implements LoginBloc {}

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  late MockLoginBloc mockLoginBloc;
  late MockBuildContext mockBuildContext;

  setUpAll(() {
    mockBuildContext = MockBuildContext();
    registerFallbackValue(MockBuildContext());
    registerFallbackValue(LoginStudentEvent(
      context: mockBuildContext,
      email: "test@gmail.com",
      password: "password123",
    ));
  });

  setUp(() {
    mockLoginBloc = MockLoginBloc();

    when(() => mockLoginBloc.state).thenReturn(LoginState.initial());
    whenListen(
      mockLoginBloc,
      Stream<LoginState>.fromIterable([
        LoginState.initial(),
        LoginState(isLoading: false, isSuccess: true),
      ]),
    );
  });

  Widget createTestWidget() {
    return BlocProvider<LoginBloc>.value(
      value: mockLoginBloc,
      child: MaterialApp(
        home: LoginView(),
      ),
    );
  }

  testWidgets('LoginView UI test - renders correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget());

    // ✅ Verify text
    expect(find.text('Welcome Back!'), findsOneWidget);

    // ✅ Check input fields
    expect(find.widgetWithText(TextFormField, 'Email'), findsOneWidget);
    expect(find.widgetWithText(TextFormField, 'Password'), findsOneWidget);

    // ✅ Check login button
    expect(find.widgetWithText(ElevatedButton, 'Login'), findsOneWidget);
  });
}
