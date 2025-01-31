import 'package:glownepal_mobile_app_5th_sem/features/authentication/domain/entity/user_signup_entity.dart';

class LoginResponseEntity {
  final UserSignupEntity user;
  final String token;

  LoginResponseEntity({required this.user, required this.token});
}
