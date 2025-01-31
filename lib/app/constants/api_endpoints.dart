class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 5000);
  static const Duration receiveTimeout = Duration(seconds: 5000);

  // Base URL - Change according to your platform
  static const String baseUrl = "http://10.0.2.2:4000/api/";

  // ============= Authentication Routes =============
  static const String userLogin = "user/login";
  static const String userRegister = "user/register";
  static const String getUserProfile = "user/profile";
  static const String updateUserProfile = "user/updateProfile";
  static const String deleteUser = "user/delete";

  // ============= Image Upload Routes =============
  static const String imageUrl = "http://10.0.2.2:4000/public/uploads/";
  static const String uploadImage = "user/uploadImage";
}
