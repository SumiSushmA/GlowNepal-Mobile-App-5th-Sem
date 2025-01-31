import 'package:dio/dio.dart';

class DioErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    String errorMessage = "Something went wrong!";

    if (err.response != null) {
      switch (err.response!.statusCode) {
        case 400:
          errorMessage = err.response!.data['message'] ?? "Bad Request!";
          break;
        case 401:
          errorMessage = err.response!.data['message'] ??
              "Unauthorized! Please log in again.";
          break;
        case 403:
          errorMessage =
              err.response!.data['message'] ?? "Forbidden! Access denied.";
          break;
        case 404:
          errorMessage = err.response!.data['message'] ?? "Not Found!";
          break;
        case 500:
          errorMessage =
              err.response!.data['message'] ?? "Internal Server Error!";
          break;
        default:
          errorMessage =
              err.response!.data['message'] ?? "Unexpected error occurred!";
      }
      err = DioException(
        requestOptions: err.requestOptions,
        response: err.response,
        error: errorMessage,
        type: err.type,
      );
    } else {
      // Handle Connection Errors
      errorMessage = "No internet connection or server not responding!";
      err = DioException(
        requestOptions: err.requestOptions,
        error: errorMessage,
        type: err.type,
      );
    }

    super.onError(err, handler);
  }
}
