import 'package:dio/dio.dart';
import 'package:glownepal_mobile_app_5th_sem/app/constants/api_endpoints.dart';
import 'package:glownepal_mobile_app_5th_sem/core/network/dio_error_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService {
  final Dio _dio;

  Dio get dio => _dio;

  ApiService(this._dio) {
    _dio
      ..options.baseUrl = ApiEndpoints.baseUrl
      ..options.connectTimeout = ApiEndpoints.connectionTimeout
      ..options.receiveTimeout = ApiEndpoints.receiveTimeout
      ..interceptors.add(DioErrorInterceptor()) // Custom error handling
      ..interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        error: true,
        compact: true,
      ))
      ..options.headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };
  }

  // ========================== Authentication ==========================

  Future<Map<String, dynamic>?> loginUser(String email, String password) async {
    try {
      final response = await _dio.post(
        ApiEndpoints.userLogin,
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200 && response.data['success'] == true) {
        return response.data['user']; // Assuming API returns user details
      }
    } catch (e) {
      rethrow; // Forward error for UI handling
    }
    return null;
  }

  Future<Map<String, dynamic>?> registerUser(
      String name, String email, String password, String phone) async {
    try {
      final response = await _dio.post(
        ApiEndpoints.userRegister,
        data: {
          'name': name,
          'email': email,
          'password': password,
          'phone': phone,
        },
      );

      if (response.statusCode == 201 && response.data['success'] == true) {
        return response
            .data['user']; // Return user data on successful registration
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  // ========================== Image Upload ==========================

  Future<String?> uploadImage(FormData imageData) async {
    try {
      final response = await _dio.post(
        ApiEndpoints.uploadImage,
        data: imageData,
      );

      if (response.statusCode == 200 && response.data['success'] == true) {
        return response.data['imageUrl']; // Return uploaded image URL
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }
}
