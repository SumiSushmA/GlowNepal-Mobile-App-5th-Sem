import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:glownepal_mobile_app_5th_sem/app/usecase/usecase.dart';
import 'package:glownepal_mobile_app_5th_sem/core/error/failure.dart';
import 'package:glownepal_mobile_app_5th_sem/features/authentication/domain/entity/user_signup_entity.dart';
import 'package:glownepal_mobile_app_5th_sem/features/authentication/domain/repository/user_signup_domain_repository.dart';

class SignupUseCase {
  final UserSignupDomainRepository repository;

  SignupUseCase(this.repository);

  Future<void> call(UserSignupEntity userEntity) async {
    await repository.createUser(userEntity);
  }
}

class GetUserByEmailUseCase {
  final UserSignupDomainRepository repository;

  GetUserByEmailUseCase(this.repository);

  Future<UserSignupEntity?> call(String email) async {
    return await repository.getUserByEmail(email);
  }
}

class IsEmailRegisteredUseCase {
  final UserSignupDomainRepository repository;

  IsEmailRegisteredUseCase(this.repository);

  Future<bool> call(String email) async {
    return await repository.isEmailRegistered(email);
  }
}

class DeleteUserUseCase {
  final UserSignupDomainRepository repository;

  DeleteUserUseCase(this.repository);

  Future<void> call(String email) async {
    await repository.deleteUser(email);
  }
}

class UploadImageParams {
  final File file;

  const UploadImageParams({
    required this.file,
  });
}

class UploadImageUseCase
    implements UsecaseWithParams<String, UploadImageParams> {
  final UserSignupDomainRepository _repository;

  UploadImageUseCase(this._repository);

  @override
  Future<Either<Failure, String>> call(UploadImageParams params) {
    return _repository.uploadImage(params.file);
  }
}
