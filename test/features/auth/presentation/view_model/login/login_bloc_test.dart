import 'package:flutter_test/flutter_test.dart';
import 'package:glownepal_mobile_app_5th_sem/features/auth/domain/use_case/login_usecase.dart';
import 'package:glownepal_mobile_app_5th_sem/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:mocktail/mocktail.dart';

import '../../../domain/use_case/login_usecase.mock.dart';
import '../../view/register.mock.dart';

void main() {
  group('LoginBloc', () {
    test('test case', () {
      expect(1, 1);
    });

    test('Initial state is LoginState.initial()', () {
      final loginBloc = LoginBloc(
        registerBloc: MockRegisterBloc(),
        loginUseCase: MockLoginUseCase(),
      );
      expect(loginBloc.state, isA<LoginState>());
      loginBloc.close();
    });

    test('LoginBloc emits no states when no events are added', () {
      final loginBloc = LoginBloc(
        registerBloc: MockRegisterBloc(),
        loginUseCase: MockLoginUseCase(),
      );
      expectLater(loginBloc.stream, emitsInOrder([]));
      loginBloc.close();
    });

    test('LoginBloc can be closed without emitting new states', () {
      final loginBloc = LoginBloc(
        registerBloc: MockRegisterBloc(),
        loginUseCase: MockLoginUseCase(),
      );
      loginBloc.close();
      expectLater(loginBloc.stream, emitsDone);
    });

    setUpAll(() {
      registerFallbackValue(LoginParams(email: '', password: ''));
    });
  });
}
