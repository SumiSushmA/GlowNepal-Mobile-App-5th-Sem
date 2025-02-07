// part of 'register_bloc.dart';

// sealed class RegisterEvent extends Equatable {
//   const RegisterEvent();

//   @override
//   List<Object> get props => [];
// }

// class LoadCoursesAndBatches extends RegisterEvent {}

// class UploadImage extends RegisterEvent {
//   final File file;

//   const UploadImage({
//     required this.file,
//   });
// }

// class RegisterStudent extends RegisterEvent {
//   final BuildContext context;
//   final String name; // ✅ Combined first & last name
//   final String phone;
//   final String email;
//   final String address;
//   final String dob;
//   final String gender;
//   final String username;
//   final String password;
//   final String? image;
//   final String role;

//   const RegisterStudent({
//     required this.context,
//     required this.name, // ✅ Use full name instead of fName & lName
//     required this.phone,
//     required this.email,
//     required this.username,
//     required this.password,
//     this.image,
//     required this.address,
//     required this.dob,
//     required this.gender,
//     this.role = 'user',
//   });

//   // Add Props
// }

// part of 'register_bloc.dart';

// sealed class RegisterEvent extends Equatable {
//   const RegisterEvent();

//   @override
//   List<Object?> get props => [];
// }

// class LoadCoursesAndBatches extends RegisterEvent {}

// class UploadImage extends RegisterEvent {
//   final File file;

//   const UploadImage({
//     required this.file,
//   });

//   @override
//   List<Object?> get props => [file]; // ✅ Ensures Bloc detects changes
// }

// class RegisterStudent extends RegisterEvent {
//   final BuildContext context;
//   final String name;
//   final String phone;
//   final String email;
//   final String address;
//   final String dob;
//   final String gender;
//   final String username;
//   final String password;
//   final String? image;
//   final String role;

//   const RegisterStudent({
//     required this.context,
//     required this.name,
//     required this.phone,
//     required this.email,
//     required this.username,
//     required this.password,
//     this.image,
//     required this.address,
//     required this.dob,
//     required this.gender,
//     this.role = 'user',
//   });

// @override
// List<Object?> get props => [
//       name,
//       phone,
//       email,
//       username,
//       password,
//       image,
//       address,
//       dob,
//       gender,
//       role,
//     ]; // ✅ Ensures Bloc detects changes
// }

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
