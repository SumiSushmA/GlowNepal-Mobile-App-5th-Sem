part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class NavigateRegisterScreenEvent extends LoginEvent {
  final BuildContext context;
  final Widget destination;

  const NavigateRegisterScreenEvent({
    required this.context,
    required this.destination,
  });
}

class LoginStudentEvent extends LoginEvent {
  final BuildContext context;
  final String email;
  final String password;

  const LoginStudentEvent({
    required this.context,
    required this.email,
    required this.password,
  });
}
