import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:glownepal_mobile_app_5th_sem/app/usecase/usecase.dart';
import 'package:glownepal_mobile_app_5th_sem/core/error/failure.dart';
import 'package:glownepal_mobile_app_5th_sem/features/auth/domain/entity/auth_entity.dart';
import 'package:glownepal_mobile_app_5th_sem/features/auth/domain/repository/auth_repository.dart';

class RegisterUserParams extends Equatable {
  final String name; // ✅ Use full name instead of fName & lName
  final String phone;
  final String email;
  final String username;
  final String password;
  final String? image;
  final String gender;
  final String dob;
  final String address;

  const RegisterUserParams({
    required this.gender,
    required this.dob,
    required this.address,
    required this.name, // ✅ Single field for full name
    required this.phone,
    required this.username,
    required this.password,
    this.image,
    required this.email,
  });

  // 🔹 Initial Constructor
  const RegisterUserParams.initial({
    required this.name, // ✅ Single field for full name
    required this.phone,
    required this.username,
    required this.password,
    this.image,
    required this.email,
    required this.gender,
    required this.dob,
    required this.address,
  });

  // Empty Constructor
  factory RegisterUserParams.empty() {
    return const RegisterUserParams(
      name: '',
      phone: '',
      email: '',
      username: '',
      password: '',
      image: null,
      gender: '',
      dob: '',
      address: '',
    );
  }

  @override
  List<Object?> get props =>
      [name, phone, username, password, email, address, dob, gender];
}

class RegisterUseCase implements UsecaseWithParams<void, RegisterUserParams> {
  final IAuthRepository repository;

  RegisterUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(RegisterUserParams params) {
    final authEntity = AuthEntity(
      name: params.name, // ✅ Using full name
      phone: params.phone,
      username: params.username,
      password: params.password,
      image: params.image,
      email: params.email,
      address: params.address,
      dob: params.dob,
      gender: params.gender,
    );
    return repository.registerStudent(authEntity);
  }
}
