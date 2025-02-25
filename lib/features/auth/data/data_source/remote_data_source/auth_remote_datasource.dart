import 'dart:io';

import 'package:dio/dio.dart';
import 'package:glownepal_mobile_app_5th_sem/app/constants/api_endpoints.dart';
import 'package:glownepal_mobile_app_5th_sem/features/auth/data/data_source/auth_data_source.dart';
import 'package:glownepal_mobile_app_5th_sem/features/auth/domain/entity/auth_entity.dart';

class AuthRemoteDataSource implements IAuthDataSource {
  final Dio _dio;

  AuthRemoteDataSource(this._dio);

  @override
  Future<void> registerStudent(AuthEntity student) async {
    try {
      Response response = await _dio.post(
        ApiEndpoints.userRegister,
        data: {
          "name": student.name, // ✅ Use full name directly
          "phone": student.phone,
          "image": student.image,
          "username": student.username,
          "password": student.password,
          "email": student.email, // ✅ Ensure email is included
          "address": student.address,
          "dob": student.dob,
          "gender": student.gender,
        },
      );

      if (response.statusCode == 201) {
        return;
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<AuthEntity> getCurrentUser() {
    throw UnimplementedError();
  }

  @override
  Future<String> loginStudent(String email, String password) async {
    try {
      Response response = await _dio.post(
        ApiEndpoints.userLogin,
        data: {
          "email": email,
          "password": password,
        },
      );

      print("Response:::: $response");
      if (response.statusCode == 200) {
        final str = response.data['token'];
        return str;
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<String> uploadProfilePicture(File file) async {
    try {
      String fileName = file.path.split('/').last;
      FormData formData = FormData.fromMap(
        {
          'profilePicture': await MultipartFile.fromFile(
            file.path,
            filename: fileName,
          ),
        },
      );

      Response response = await _dio.post(
        ApiEndpoints.uploadImage,
        data: formData,
      );

      if (response.statusCode == 200) {
        final str = response.data['data'];
        return str;
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }
}
