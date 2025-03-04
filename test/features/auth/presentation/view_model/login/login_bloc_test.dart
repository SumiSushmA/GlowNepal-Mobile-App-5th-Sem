// import 'package:dartz/dartz.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:glownepal_mobile_app_5th_sem/core/error/failure.dart';
// import 'package:glownepal_mobile_app_5th_sem/features/auth/domain/use_case/login_usecase.dart';
// import 'package:glownepal_mobile_app_5th_sem/features/auth/presentation/view_model/login/login_bloc.dart';
// import 'package:glownepal_mobile_app_5th_sem/features/auth/presentation/view_model/signup/register_bloc.dart';
// import 'package:glownepal_mobile_app_5th_sem/features/home/presentation/view_model/home_cubit.dart';
// import 'package:mocktail/mocktail.dart';

// class MockRegisterBloc extends Mock implements RegisterBloc {}

// class MockHomeCubit extends Mock implements HomeCubit {}

// class MockLoginUseCase extends Mock implements LoginUseCase {}

// class FakeLoginParams extends Fake implements LoginParams {
//   @override
//   String get username => "testUser";

//   @override
//   String get password => "testPass";
// }

// class MockBuildContext extends Mock implements BuildContext {}

// void main() {
//   late LoginBloc loginBloc;
//   late MockRegisterBloc mockRegisterBloc;
//   late MockHomeCubit mockHomeCubit;
//   late MockLoginUseCase mockLoginUseCase;

//   setUpAll(() {
//     registerFallbackValue(FakeLoginParams());
//   });

//   setUp(() {
//     EquatableConfig.stringify = true; // Enable better debugging

//     mockRegisterBloc = MockRegisterBloc();
//     mockHomeCubit = MockHomeCubit();
//     mockLoginUseCase = MockLoginUseCase();

//     loginBloc = LoginBloc(
//       registerBloc: mockRegisterBloc,
//       loginUseCase: mockLoginUseCase,
//     );
//   });

//   tearDown(() {
//     loginBloc.close();
//   });

//   test('Initial state should be LoginState.initial()', () {
//     expect(loginBloc.state.isLoading, false);
//     expect(loginBloc.state.isSuccess, false);
//   });

//   testWidgets('Navigating to Register Screen should not crash', (tester) async {
//     await tester.pumpWidget(MaterialApp(
//       home: Builder(
//         builder: (context) {
//           loginBloc.add(
//             NavigateRegisterScreenEvent(
//               context: context,
//               destination: Container(),
//             ),
//           );
//           return Container();
//         },
//       ),
//     ));
//   });

//   testWidgets('Navigating to Home Screen should not crash', (tester) async {
//     await tester.pumpWidget(MaterialApp(
//       home: Builder(
//         builder: (context) {
//           loginBloc.add(
//             NavigateHomeScreenEvent(
//               context: context,
//               destination: Container(),
//             ),
//           );
//           return Container();
//         },
//       ),
//     ));
//   });

//   test('LoginStudentEvent should set loading state initially', () async {
//     // Arrange: Mock a delayed response from LoginUseCase to simulate an async call
//     when(() => mockLoginUseCase(any())).thenAnswer((_) async => Future.delayed(
//         Duration(milliseconds: 500),
//         () => Left(ServerFailure(message: "Invalid Credentials"))));

//     // Act: Dispatch LoginStudentEvent
//     loginBloc.add(LoginStudentEvent(
//       email: "testUser@email.com",
//       password: "testPass",
//       context: MockBuildContext(),
//     ));

//     // Assert: The first emitted state should have isLoading = true
//     await expectLater(
//       loginBloc.stream,
//       emits(predicate<LoginState>((state) => state.isLoading == true)),
//     );
//   });
// }
