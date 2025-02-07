import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:glownepal_mobile_app_5th_sem/core/error/failure.dart';
import 'package:glownepal_mobile_app_5th_sem/features/auth/domain/use_case/login_usecase.dart';
import 'package:mocktail/mocktail.dart';

import 'token.mock.dart';
import 'user_repo.mock.dart';

void main() {
  late UserRepoMock repository;
  late MockTokenSharedPrefs tokenSharedPrefs;
  late LoginUseCase useCase;

  setUp(() {
    repository = UserRepoMock();
    tokenSharedPrefs = MockTokenSharedPrefs();
    useCase = LoginUseCase(repository, tokenSharedPrefs);
  });

  test(
      'should call the [AuthRepo.login] with correct username and password (sushma, sushma123)',
      () async {
    when(() => repository.loginStudent(any(), any())).thenAnswer(
      (invocation) async {
        final username = invocation.positionalArguments[0] as String;
        final password = invocation.positionalArguments[1] as String;
        if (username == 'sushma' && password == 'sushma123') {
          return Future.value(const Right('token'));
        } else {
          return Future.value(
              Left(ApiFailure(message: 'Invalid username or password')));
        }
      },
    );

    when(() => tokenSharedPrefs.saveToken(any())).thenAnswer(
      (_) async => Right(null),
    );
    final result = await useCase(LoginParams(
      username: 'sushma',
      password: 'sushma123',
    ));
    expect(result, const Right('token'));
    verify(() => repository.loginStudent(any(), any())).called(1);
    verify(() => tokenSharedPrefs.saveToken(any())).called(1);
    verifyNoMoreInteractions(repository);
    verifyNoMoreInteractions(tokenSharedPrefs);
  });
}
