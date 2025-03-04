part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class UploadImage extends RegisterEvent {
  final File file;

  const UploadImage({required this.file});
}

class RegisterStudent extends RegisterEvent {
  final BuildContext context;
  final String name;
  final String phone;
  final String email;
  final String address;
  final String dob;
  final String gender;
  final String username;
  final String password;
  final String? image;
  final String role;

  const RegisterStudent({
    required this.context,
    required this.name,
    required this.phone,
    required this.email,
    required this.username,
    required this.password,
    this.image,
    required this.address,
    required this.dob,
    required this.gender,
    this.role = 'user',
  });
}

