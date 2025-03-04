part of 'register_bloc.dart';

class RegisterState extends Equatable {
  final bool isLoading;
  final bool isSuccess;
  final bool isImageUploaded;
  final String? imageName;

  // ✅ Add Missing Fields
  final String? name;
  final String? phone;
  final String? email;
  final String? address;
  final String? dob;
  final String? gender;
  final String? username;
  final String? password;

  const RegisterState({
    required this.isLoading,
    required this.isSuccess,
    required this.isImageUploaded,
    this.imageName,
    this.name,
    this.phone,
    this.email,
    this.address,
    this.dob,
    this.gender,
    this.username,
    this.password,
  });

  const RegisterState.initial()
      : isLoading = false,
        isSuccess = false,
        isImageUploaded = false,
        imageName = null,
        name = null,
        phone = null,
        email = null,
        address = null,
        dob = null,
        gender = null,
        username = null,
        password = null;

  RegisterState copyWith({
    bool? isLoading,
    bool? isSuccess,
    bool? isImageUploaded,
    String? imageName,
    String? name,
    String? phone,
    String? email,
    String? address,
    String? dob,
    String? gender,
    String? username,
    String? password,
  }) {
    return RegisterState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isImageUploaded: isImageUploaded ?? this.isImageUploaded,
      imageName: imageName ?? this.imageName,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      address: address ?? this.address,
      dob: dob ?? this.dob,
      gender: gender ?? this.gender,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        isSuccess,
        isImageUploaded,
        imageName,
        name,
        phone,
        email,
        address,
        dob,
        gender,
        username,
        password,
      ];
}
