import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:glownepal_mobile_app_5th_sem/core/error/failure.dart';
import 'package:glownepal_mobile_app_5th_sem/features/auth/domain/use_case/login_usecase.dart';
import 'package:mocktail/mocktail.dart';

import 'delete_user_usecase_test.dart';
import 'token.mock.dart';

class FakeLoginParams extends Fake implements LoginParams {}

void main() {
  late LoginUseCase loginUseCase;
  late MockAuthRepository mockAuthRepository;
  late MockTokenSharedPrefs mockTokenSharedPrefs;

  setUpAll(() {
    // ✅ Registering the fake class instead of passing an instance
    registerFallbackValue(FakeLoginParams());
  });

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    mockTokenSharedPrefs = MockTokenSharedPrefs();
    loginUseCase = LoginUseCase(mockAuthRepository, mockTokenSharedPrefs);
  });

  final email = 'test@example.com';
  final password = 'password123';
  final token = 'mockToken';
  final loginParams = LoginParams(email: email, password: password);

  test('should return Failure when login fails', () async {
    final failure = ApiFailure(message: 'Login Failed', statusCode: 401);

    when(() => mockAuthRepository.loginStudent(any(), any()))
        .thenAnswer((_) async => Left(failure));

    final result = await loginUseCase(loginParams);

    expect(result, Left(failure));

    verify(() => mockAuthRepository.loginStudent(email, password)).called(1);
    verifyNoMoreInteractions(mockAuthRepository);
    verifyZeroInteractions(mockTokenSharedPrefs);
  });
}
