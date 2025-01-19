import 'package:glownepal_mobile_app_5th_sem/features/authentication/domain/entity/user_signup_entity.dart';

abstract class UserSignupEvent {}

class SignupUserEvent extends UserSignupEvent {
  final UserSignupEntity userEntity;

  SignupUserEvent(this.userEntity);
}
