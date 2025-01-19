import 'package:glownepal_mobile_app_5th_sem/features/authentication/domain/entity/user_login_entity.dart';

abstract class UserLoginState {}

class UserLoginInitialState extends UserLoginState {}

class UserLoginLoadingState extends UserLoginState {}

class UserLoginSuccessState extends UserLoginState {}

class UserLoginSavedState extends UserLoginState {
  final String message;

  UserLoginSavedState(this.message);
}

class UserLoginDeletedState extends UserLoginState {
  final String message;

  UserLoginDeletedState(this.message);
}

class UserLoginErrorState extends UserLoginState {
  final String message;

  UserLoginErrorState(this.message);
}

class UserLoginAllUsersState extends UserLoginState {
  final List<UserLoginEntity> users;

  UserLoginAllUsersState(this.users);
}
