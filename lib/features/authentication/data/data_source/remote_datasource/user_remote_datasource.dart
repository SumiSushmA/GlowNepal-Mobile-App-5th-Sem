import 'dart:io';

import 'package:dio/dio.dart';
import 'package:glownepal_mobile_app_5th_sem/app/constants/api_endpoints.dart';
import 'package:glownepal_mobile_app_5th_sem/core/network/api_service.dart';
import 'package:glownepal_mobile_app_5th_sem/features/authentication/data/model/user_api_model.dart';
import 'package:glownepal_mobile_app_5th_sem/features/authentication/domain/entity/user_signup_entity.dart';

class UserRemoteDataSource {
  final ApiService apiService;

  UserRemoteDataSource(this.apiService);

  /// Creates a new user
  Future<void> createUser(UserSignupEntity userEntity) async {
    try {
      final userModel = UserApiModel.fromSignupEntity(userEntity);
      await apiService.registerUser(userModel.name, userModel.email,
          userEntity.password, userModel.phone);
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// Logs in a user
  Future<String> login(String email, String password) async {
    try {
      final response = await apiService.loginUser(email, password);
      if (response != null && response['token'] != null) {
        return response['token'] as String;
      } else {
        throw Exception('Invalid login response');
      }
    } on DioException catch (e) {
      throw Exception('Dio Error: ${e.message ?? 'Unknown error'}');
    } catch (e) {
      throw Exception('An unexpected error occurred: $e');
    }
  }

  /// Deletes a user by email
  Future<void> deleteUser(String email) async {
    try {
      final response = await apiService.dio.delete(
        ApiEndpoints.deleteUser,
        data: {'email': email},
      );
      if (response.statusCode != 200) {
        throw Exception('Failed to delete user');
      }
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// Uploads a profile image
  Future<String> uploadImage(File file) async {
    try {
      String fileName = file.path.split('/').last;
      FormData formData = FormData.fromMap({
        "profilePicture":
            await MultipartFile.fromFile(file.path, filename: fileName)
      });

      final response = await apiService.uploadImage(formData);

      if (response != null) {
        return response;
      } else {
        throw Exception('Invalid response from server');
      }
    } on DioException catch (e) {
      throw Exception('Network error during profile upload: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}
