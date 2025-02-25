part of 'register_bloc.dart';

class RegisterState extends Equatable {
  final bool isLoading;
  final bool isSuccess; // Form submission success
  final bool isImageUploaded; // ✅ New State for Image Upload
  final String? imageName;

  const RegisterState({
    required this.isLoading,
    required this.isSuccess,
    required this.isImageUploaded,
    this.imageName,
  });

  const RegisterState.initial()
      : isLoading = false,
        isSuccess = false,
        isImageUploaded = false, // ✅ Default to false
        imageName = null;

  RegisterState copyWith({
    bool? isLoading,
    bool? isSuccess,
    bool? isImageUploaded,
    String? imageName,
  }) {
    return RegisterState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isImageUploaded: isImageUploaded ?? this.isImageUploaded,
      imageName: imageName ?? this.imageName,
    );
  }

  @override
  List<Object?> get props => [isLoading, isSuccess, isImageUploaded, imageName];
}
