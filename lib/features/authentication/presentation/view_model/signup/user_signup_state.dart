abstract class UserSignupState {}

class SignupInitialState extends UserSignupState {}

class SignupLoadingState extends UserSignupState {}

class SignupSuccessState extends UserSignupState {
  final String message;

  SignupSuccessState(this.message);
}

class SignupErrorState extends UserSignupState {
  final String message;

  SignupErrorState(this.message);
}

// part of 'user_signup_bloc.dart';

// class UserSignupState extends Equatable {
//   final bool isLoading;
//   final bool isSuccess;
//   final String message;
//   final bool isImageLoading;
//   final bool isImageSuccess;
//   final String? imageUrl;

//   const UserSignupState({
//     required this.isLoading,
//     required this.isSuccess,
//     required this.message,
//     required this.isImageLoading,
//     required this.isImageSuccess,
//     this.imageUrl,
//   });

//   /// **🔹 Initial State**
//   factory UserSignupState.initial() {
//     return const UserSignupState(
//       isLoading: false,
//       isSuccess: false,
//       message: '',
//       isImageLoading: false,
//       isImageSuccess: false,
//       imageUrl: null,
//     );
//   }

//   /// **🔹 Copy State with Updates**
//   UserSignupState copyWith({
//     bool? isLoading,
//     bool? isSuccess,
//     String? message,
//     bool? isImageLoading,
//     bool? isImageSuccess,
//     String? imageUrl,
//   }) {
//     return UserSignupState(
//       isLoading: isLoading ?? this.isLoading,
//       isSuccess: isSuccess ?? this.isSuccess,
//       message: message ?? this.message,
//       isImageLoading: isImageLoading ?? this.isImageLoading,
//       isImageSuccess: isImageSuccess ?? this.isImageSuccess,
//       imageUrl: imageUrl ?? this.imageUrl,
//     );
//   }

//   @override
//   List<Object?> get props => [isLoading, isSuccess, message, isImageLoading, isImageSuccess, imageUrl];
// }
