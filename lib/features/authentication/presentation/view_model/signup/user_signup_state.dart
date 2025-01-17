abstract class UserSignupState {}

class SignupInitialState extends UserSignupState {}

class SignupLoadingState extends UserSignupState {}

class SignupSuccessState extends UserSignupState {
  final String message;

  SignupSuccessState(this.message);
}

class SignupErrorState extends UserSignupState {
  final String message;

  SignupErrorState(this.message);
}
