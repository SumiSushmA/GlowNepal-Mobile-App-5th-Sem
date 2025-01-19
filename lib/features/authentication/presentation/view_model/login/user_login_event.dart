abstract class UserLoginEvent {}

class LoginUserEvent extends UserLoginEvent {
  final String email;
  final String password;

  LoginUserEvent({required this.email, required this.password});
}

class SaveUserEvent extends UserLoginEvent {
  final String email;
  final String password;

  SaveUserEvent({required this.email, required this.password});
}

class DeleteUserEvent extends UserLoginEvent {
  final String email;

  DeleteUserEvent({required this.email});
}

class GetAllUsersEvent extends UserLoginEvent {}
