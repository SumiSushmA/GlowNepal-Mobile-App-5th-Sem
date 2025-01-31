import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:glownepal_mobile_app_5th_sem/app/constants/api_endpoints.dart';
import 'package:glownepal_mobile_app_5th_sem/core/error/failure.dart';
import 'package:glownepal_mobile_app_5th_sem/features/authentication/data/data_source/remote_datasource/user_remote_datasource.dart';
import 'package:glownepal_mobile_app_5th_sem/features/authentication/domain/entity/user_signup_entity.dart';
import 'package:glownepal_mobile_app_5th_sem/features/authentication/domain/repository/user_signup_domain_repository.dart';

class UserSignupRemoteRepository implements UserSignupDomainRepository {
  final UserRemoteDataSource userRemoteDataSource;
  final Dio _dio;

  UserSignupRemoteRepository(this.userRemoteDataSource, this._dio);

  @override
  Future<void> createUser(UserSignupEntity userEntity) async {
    await userRemoteDataSource.createUser(userEntity);
  }

  @override
  Future<UserSignupEntity?> getUserByEmail(String email) async {
    return null;
  }

  @override
  Future<bool> isEmailRegistered(String email) async {
    return false;
  }

  @override
  Future<void> deleteUser(String email) async {
    await userRemoteDataSource.deleteUser(email);
  }

  @override
  Future<Either<Failure, String>> uploadImage(File file) async {
    try {
      String fileName = file.path.split('/').last;
      FormData formData = FormData.fromMap({
        "profilePicture":
            await MultipartFile.fromFile(file.path, filename: fileName)
      });

      Response response =
          await _dio.post(ApiEndpoints.uploadImage, data: formData);

      if (response.statusCode == 200 && response.data != null) {
        return Right(response.data['imageUrl'] ?? '');
      } else {
        return Left(ApiFailure(
            statusCode: response.statusCode ?? 500,
            message:
                response.statusMessage ?? 'Unknown error during image upload'));
      }
    } on DioException catch (e) {
      return Left(ApiFailure(
          statusCode: e.response?.statusCode ?? 500,
          message: 'Network error during profile upload: ${e.message}'));
    } catch (e) {
      return Left(ApiFailure(statusCode: 500, message: 'Unexpected error: $e'));
    }
  }
}
