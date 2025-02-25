// class ApiEndpoints {
//   ApiEndpoints._();

//   static const Duration connectionTimeout = Duration(seconds: 5000);
//   static const Duration receiveTimeout = Duration(seconds: 5000);

//   // Base URL - Change according to your platform
//   static const String baseUrl = "http://10.0.2.2:4000/api/";

//   // ============= Authentication Routes =============
//   static const String userLogin = "user/login";
//   static const String userRegister = "user/register";
//   static const String getUserProfile = "user/profile";
//   static const String updateUserProfile = "user/updateProfile";
//   static const String deleteUser = "user/delete";
//   static const String getAllUsers = "user/getAllUsers/";

//   // ============= Image Upload Routes =============
//   static const String imageUrl = "http://10.0.2.2:4000/public/uploads/";
//   static const String uploadImage = "user/uploadImage";
// }

class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 5000);
  static const Duration receiveTimeout = Duration(seconds: 5000);

  // Base URL - Change according to your platform
  static const String baseUrl = "http://10.0.2.2:4000/api/";

  // ============= Authentication Routes =============
  static const String userLogin = "user/login";
  static const String userRegister = "user/register";
  static const String forgetPassword = "user/forget_password";
  static const String resetPassword = "user/reset_password/";

  // ============= User Profile Routes =============
  static const String getUserProfile = "user/get-profile";
  static const String updateUserProfile = "user/update-profile";

  // ============= Appointment Routes =============
  static const String bookAppointment = "user/book-appointment";
  static const String listAppointments = "user/appointments";
  static const String cancelAppointment = "user/cancel-appointment";

  // ============= Image Upload Routes =============
  static const String imageUrl = "http://10.0.2.2:4000/public/uploads/";
  static const String uploadImage = "user/uploadImage";
}
