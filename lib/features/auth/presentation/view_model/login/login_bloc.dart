import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glownepal_mobile_app_5th_sem/app/di/di.dart';
import 'package:glownepal_mobile_app_5th_sem/core/common/snackbar/snackbar.dart';
import 'package:glownepal_mobile_app_5th_sem/features/auth/domain/use_case/login_usecase.dart';
import 'package:glownepal_mobile_app_5th_sem/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:glownepal_mobile_app_5th_sem/features/home/presentation/view/main_home_view.dart';
import 'package:glownepal_mobile_app_5th_sem/features/home/presentation/view_model/home_cubit.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final RegisterBloc _registerBloc;
  final LoginUseCase _loginUseCase;

  LoginBloc({
    required RegisterBloc registerBloc,
    required LoginUseCase loginUseCase,
  })  : _registerBloc = registerBloc,
        _loginUseCase = loginUseCase,
        super(LoginState.initial()) {
    on<LoginStudentEvent>(
      (event, emit) async {
        emit(state.copyWith(isLoading: true));

        final result = await _loginUseCase(
          LoginParams(
            email: event.email,
            password: event.password,
          ),
        );

        result.fold(
          (failure) {
            emit(state.copyWith(isLoading: false, isSuccess: false));
            showMySnackBar(
              context: event.context,
              message: "Invalid Credentials",
              color: Colors.red,
            );
          },
          (token) {
            emit(state.copyWith(isLoading: false, isSuccess: true));

            /// ✅ Navigate to HomeView with `BlocProvider`
            Navigator.pushReplacement(
              event.context,
              MaterialPageRoute(
                builder: (context) => BlocProvider(
                  create: (context) => getIt<HomeCubit>(),
                  // child: HomeView(),
                  child: MainHomeView(),
                ),
              ),
            );
          },
        );
      },
    );

    /// ✅ Fixed Navigation to Register Screen
    on<NavigateRegisterScreenEvent>(
      (event, emit) {
        Navigator.push(
          event.context,
          MaterialPageRoute(
            builder: (context) => BlocProvider.value(
              value: _registerBloc,
              child: event.destination,
            ),
          ),
        );
      },
    );
  }
}
