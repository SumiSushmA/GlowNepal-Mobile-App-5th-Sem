import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:glownepal_mobile_app_5th_sem/core/error/failure.dart';
import 'package:glownepal_mobile_app_5th_sem/features/auth/data/data_source/remote_data_source/auth_remote_datasource.dart';
import 'package:glownepal_mobile_app_5th_sem/features/auth/domain/entity/auth_entity.dart';
import 'package:glownepal_mobile_app_5th_sem/features/auth/domain/repository/auth_repository.dart';

class AuthRemoteRepository implements IAuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRemoteRepository(this._authRemoteDataSource);

  @override
  Future<Either<Failure, void>> registerStudent(AuthEntity student) async {
    try {
      await _authRemoteDataSource.registerStudent(student);
      return Right(null);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthEntity>> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> loginStudent(
      String email, String password) async {
    try {
      final token = await _authRemoteDataSource.loginStudent(email, password);
      return Right(token);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> uploadProfilePicture(File file) async {
    try {
      final imageName = await _authRemoteDataSource.uploadProfilePicture(file);
      return Right(imageName);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteStudent(String id) {
    // TODO: implement deleteStudent
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<AuthEntity>>> getAllStudents() {
    // TODO: implement getAllStudents
    throw UnimplementedError();
  }
}
