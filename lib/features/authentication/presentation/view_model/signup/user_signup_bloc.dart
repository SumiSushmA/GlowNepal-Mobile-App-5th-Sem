import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glownepal_mobile_app_5th_sem/features/authentication/domain/use_case/signup/user_signup_usecases.dart';

import 'user_signup_event.dart';
import 'user_signup_state.dart';

class UserSignupBloc extends Bloc<UserSignupEvent, UserSignupState> {
  final SignupUseCase signupUseCase;

  UserSignupBloc(this.signupUseCase) : super(SignupInitialState()) {
    on<SignupUserEvent>((event, emit) async {
      emit(SignupLoadingState());
      try {
        await signupUseCase.call(event.userEntity);
        emit(SignupSuccessState("User registered successfully!"));
      } catch (e) {
        emit(SignupErrorState("Failed to register user: $e"));
      }
    });
  }
}
