import 'package:glownepal_mobile_app_5th_sem/features/authentication/domain/entity/user_signup_entity.dart';

abstract class UserSignupEvent {}

class SignupUserEvent extends UserSignupEvent {
  final UserSignupEntity userEntity;

  SignupUserEvent(this.userEntity);
}
// part of 'user_signup_bloc.dart';

// abstract class UserSignupEvent extends Equatable {
//   @override
//   List<Object?> get props => [];
// }

// /// **🚀 Event for User Signup**
// class SignupUserEvent extends UserSignupEvent {
//   final UserSignupEntity userEntity;

//   SignupUserEvent(this.userEntity);

//   @override
//   List<Object?> get props => [userEntity];
// }

// /// **📷 Event for Image Upload**
// class UploadImageEvent extends UserSignupEvent {
//   final File file;

//   UploadImageEvent(this.file);

//   @override
//   List<Object?> get props => [file];
// }
