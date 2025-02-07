// import 'package:equatable/equatable.dart';

// class AuthEntity extends Equatable {
//   final String? userId;
//   final String name; // ✅ Using `name` directly
//   final String? image;
//   final String phone;
//   final String gender;
//   final String dob;
//   final String address;
//   final String username;
//   final String email;
//   final String password;

//   const AuthEntity({
//     this.userId,
//     required this.name, // ✅ No more fName & lName
//     this.image,
//     required this.phone,
//     required this.username,
//     required this.password,
//     required this.email,
//     required this.address,
//     required this.dob,
//     required this.gender,
//   });

//   @override
//   List<Object?> get props => [
//         userId,
//         name, // ✅ Using full name
//         image,
//         phone,
//         username,
//         password,
//         email,
//         address,
//         dob,
//         gender
//       ];
// }

import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String? userId;
  final String name;
  final String? image;
  final String phone;
  final String gender;
  final String dob;
  final String address;
  final String username;
  final String email;
  final String password;

  const AuthEntity({
    this.userId,
    required this.name,
    this.image,
    required this.phone,
    required this.username,
    required this.password,
    required this.email,
    required this.address,
    required this.dob,
    required this.gender,
  });

  // Empty Constructor
  factory AuthEntity.empty() {
    return const AuthEntity(
      userId: null,
      name: '',
      image: null,
      phone: '',
      username: '',
      password: '',
      email: '',
      address: '',
      dob: '',
      gender: '',
    );
  }

  @override
  List<Object?> get props => [
        userId,
        name,
        image,
        phone,
        username,
        password,
        email,
        address,
        dob,
        gender
      ];
}
