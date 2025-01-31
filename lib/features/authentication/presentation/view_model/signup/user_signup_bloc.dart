import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glownepal_mobile_app_5th_sem/features/authentication/domain/use_case/signup/user_signup_usecases.dart';

import 'user_signup_event.dart';
import 'user_signup_state.dart';

class UserSignupBloc extends Bloc<UserSignupEvent, UserSignupState> {
  final SignupUseCase signupUseCase;

  UserSignupBloc(this.signupUseCase) : super(SignupInitialState()) {
    on<SignupUserEvent>((event, emit) async {
      emit(SignupLoadingState());
      try {
        await signupUseCase.call(event.userEntity);
        emit(SignupSuccessState("User registered successfully!"));
      } catch (e) {
        emit(SignupErrorState("Failed to register user: $e"));
      }
    });
  }
}

// import 'dart:io';

// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:glownepal_mobile_app_5th_sem/features/authentication/domain/entity/user_signup_entity.dart';
// import 'package:glownepal_mobile_app_5th_sem/features/authentication/domain/use_case/signup/user_signup_usecases.dart';

// part 'user_signup_event.dart';
// part 'user_signup_state.dart';

// class UserSignupBloc extends Bloc<UserSignupEvent, UserSignupState> {
//   final SignupUseCase signupUseCase;
//   final UploadImageUseCase uploadImageUseCase;

//   UserSignupBloc({
//     required this.signupUseCase,
//     required this.uploadImageUseCase,
//   }) : super(UserSignupState.initial()) {
//     on<SignupUserEvent>(_onSignupUser);
//     on<UploadImageEvent>(_onUploadImage);
//   }

//   /// **🚀 Handle User Signup**
//   Future<void> _onSignupUser(
//       SignupUserEvent event, Emitter<UserSignupState> emit) async {
//     emit(state.copyWith(isLoading: true, message: 'Registering user...'));
//     try {
//       await signupUseCase.call(event.userEntity);
//       emit(state.copyWith(
//           isLoading: false,
//           isSuccess: true,
//           message: "User registered successfully!"));
//     } catch (e) {
//       emit(state.copyWith(
//           isLoading: false,
//           isSuccess: false,
//           message: "Failed to register user: $e"));
//     }
//   }

//   /// **📷 Handle Image Upload**
//   Future<void> _onUploadImage(
//       UploadImageEvent event, Emitter<UserSignupState> emit) async {
//     emit(state.copyWith(isImageLoading: true, message: "Uploading image..."));

//     final result =
//         await uploadImageUseCase.call(UploadImageParams(file: event.file));

//     result.fold(
//       (failure) => emit(state.copyWith(
//           isImageLoading: false,
//           isImageSuccess: false,
//           message: "Failed to upload image")),
//       (imageUrl) => emit(state.copyWith(
//           isImageLoading: false,
//           isImageSuccess: true,
//           imageUrl: imageUrl,
//           message: "Image uploaded successfully")),
//     );
//   }
// }
