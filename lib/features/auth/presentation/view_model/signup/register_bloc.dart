// import 'dart:io';

// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';
// import 'package:glow_nepal/core/common/snackbar/snackbar.dart';
// import 'package:glow_nepal/features/auth/domain/use_case/register_user_usecase.dart';
// import 'package:glow_nepal/features/auth/domain/use_case/upload_image_usecase.dart';

// part 'register_event.dart';
// part 'register_state.dart';

// class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
//   final RegisterUseCase _registerUseCase;
//   final UploadImageUsecase _uploadImageUsecase;

//   RegisterBloc({
//     required RegisterUseCase registerUseCase,
//     required UploadImageUsecase uploadImageUsecase,
//   })  : _registerUseCase = registerUseCase,
//         _uploadImageUsecase = uploadImageUsecase,
//         super(RegisterState.initial()) {
//     on<RegisterStudent>(_onRegisterEvent);
//     on<UploadImage>(_onLoadImage);
//   }

//   void _onRegisterEvent(
//     RegisterStudent event,
//     Emitter<RegisterState> emit,
//   ) async {
//     emit(state.copyWith(isLoading: true));

//     final result = await _registerUseCase.call(RegisterUserParams(
//       name: event.name, // ✅ Using `name` instead of `fName` and `lName`
//       phone: event.phone,
//       username: event.username,
//       password: event.password,
//       image: state.imageName,
//       email: event.email,
//       address: event.address,
//       dob: event.dob,
//       gender: event.gender,
//     ));

//     result.fold(
//       (l) {
//         emit(state.copyWith(isLoading: false, isSuccess: false));
//         showMySnackBar(
//             context: event.context, message: l.message, color: Colors.red);
//       },
//       (r) {
//         emit(state.copyWith(isLoading: false, isSuccess: true));
//         showMySnackBar(
//             context: event.context, message: "Registration Successful");
//       },
//     );
//   }

//   void _onLoadImage(
//     UploadImage event,
//     Emitter<RegisterState> emit,
//   ) async {
//     emit(state.copyWith(isLoading: true));

//     final result = await _uploadImageUsecase.call(
//       UploadImageParams(
//         file: event.file,
//       ),
//     );

//     result.fold(
//       (l) => emit(state.copyWith(isLoading: false, isSuccess: false)),
//       (r) {
//         emit(state.copyWith(isLoading: false, isSuccess: true, imageName: r));
//       },
//     );
//   }
// }

// import 'dart:io';

// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';
// import 'package:glow_nepal/core/common/snackbar/snackbar.dart';
// import 'package:glow_nepal/features/auth/domain/use_case/register_user_usecase.dart';
// import 'package:glow_nepal/features/auth/domain/use_case/upload_image_usecase.dart';
// import 'package:glow_nepal/features/auth/presentation/view/login_view.dart';

// part 'register_event.dart';
// part 'register_state.dart';

// class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
//   final RegisterUseCase _registerUseCase;
//   final UploadImageUsecase _uploadImageUsecase;

//   RegisterBloc({
//     required RegisterUseCase registerUseCase,
//     required UploadImageUsecase uploadImageUsecase,
//   })  : _registerUseCase = registerUseCase,
//         _uploadImageUsecase = uploadImageUsecase,
//         super(RegisterState.initial()) {
//     on<RegisterStudent>(_onRegisterEvent);
//     on<UploadImage>(_onLoadImage);
//   }

//   // void _onRegisterEvent(
//   //   RegisterStudent event,
//   //   Emitter<RegisterState> emit,
//   // ) async {
//   //   emit(state.copyWith(isLoading: true));

//   //   final result = await _registerUseCase.call(RegisterUserParams(
//   //     name: event.name,
//   //     phone: event.phone,
//   //     username: event.username,
//   //     password: event.password,
//   //     image: state.imageName,
//   //     email: event.email,
//   //     address: event.address,
//   //     dob: event.dob,
//   //     gender: event.gender,
//   //   ));

//   //   result.fold(
//   //     (l) {
//   //       emit(state.copyWith(isLoading: false));
//   //       showMySnackBar(
//   //           context: event.context, message: l.message, color: Colors.red);
//   //     },
//   //     (r) {
//   //       emit(state.copyWith(isLoading: false, isSuccess: true));
//   //       showMySnackBar(
//   //           context: event.context, message: "Registration Successful");
//   //     },
//   //   );
//   // }

//   void _onRegisterEvent(
//     RegisterStudent event,
//     Emitter<RegisterState> emit,
//   ) async {
//     emit(state.copyWith(isLoading: true));

//     final result = await _registerUseCase.call(RegisterUserParams(
//       name: event.name,
//       phone: event.phone,
//       username: event.username,
//       password: event.password,
//       image: state.imageName,
//       email: event.email,
//       address: event.address,
//       dob: event.dob,
//       gender: event.gender,
//     ));

//     result.fold(
//       (l) {
//         emit(state.copyWith(isLoading: false, isSuccess: false));
//         showMySnackBar(
//           context: event.context,
//           message: l.message,
//           color: Colors.red,
//         );
//       },
//       (r) {
//         emit(state.copyWith(
//             isLoading: false, isSuccess: true)); // ✅ Ensure state updates

//         showMySnackBar(
//           context: event.context,
//           message: "Registration Successful! Redirecting to Login...",
//           color: Colors.green,
//         );

//         // ✅ Directly navigate to login after a delay to allow UI update
//         Future.delayed(const Duration(seconds: 2), () {
//           Navigator.pushReplacement(
//             event.context,
//             MaterialPageRoute(
//                 builder: (context) => LoginView()), // ✅ Navigate here
//           );
//         });
//       },
//     );
//   }

//   void _onLoadImage(
//     UploadImage event,
//     Emitter<RegisterState> emit,
//   ) async {
//     final result = await _uploadImageUsecase.call(
//       UploadImageParams(file: event.file),
//     );

//     result.fold(
//       (l) => emit(state.copyWith(isLoading: false)),
//       (r) => emit(state.copyWith(imageName: r)), // ✅ Only update imageName
//     );
//   }
// }

import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:glownepal_mobile_app_5th_sem/core/common/snackbar/snackbar.dart';
import 'package:glownepal_mobile_app_5th_sem/features/auth/domain/use_case/register_user_usecase.dart';
import 'package:glownepal_mobile_app_5th_sem/features/auth/domain/use_case/upload_image_usecase.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCase _registerUseCase;
  final UploadImageUsecase _uploadImageUsecase;

  RegisterBloc({
    required RegisterUseCase registerUseCase,
    required UploadImageUsecase uploadImageUsecase,
  })  : _registerUseCase = registerUseCase,
        _uploadImageUsecase = uploadImageUsecase,
        super(RegisterState.initial()) {
    on<RegisterStudent>(_onRegisterEvent);
    on<UploadImage>(_onLoadImage);
  }

  void _onRegisterEvent(
    RegisterStudent event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final result = await _registerUseCase.call(RegisterUserParams(
      name: event.name,
      phone: event.phone,
      username: event.username,
      password: event.password,
      image: state.imageName,
      email: event.email,
      address: event.address,
      dob: event.dob,
      gender: event.gender,
    ));

    result.fold(
      (l) {
        emit(state.copyWith(isLoading: false, isSuccess: false));
        showMySnackBar(
            context: event.context, message: l.message, color: Colors.red);
      },
      (r) {
        emit(state.copyWith(isLoading: false, isSuccess: true));

        // ✅ Check if image is uploaded before navigating
        if (state.isImageUploaded) {
          showMySnackBar(
              context: event.context, message: "Registration Successful");
          Navigator.pop(event.context); // ✅ Navigate after both success
        }
      },
    );
  }

  void _onLoadImage(
    UploadImage event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final result = await _uploadImageUsecase.call(
      UploadImageParams(file: event.file),
    );

    result.fold(
      (l) => emit(state.copyWith(isLoading: false, isSuccess: false)),
      (r) {
        emit(state.copyWith(
          isLoading: false,
          isImageUploaded: true, // ✅ Set image upload success
          imageName: r,
        ));
      },
    );
  }
}
