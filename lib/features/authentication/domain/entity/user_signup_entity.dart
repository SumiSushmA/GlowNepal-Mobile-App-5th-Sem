class UserSignupEntity {
  final String name;
  final String email;
  final String password;
  final String profileImagePath;
  final String phone;
  final String gender;
  final String? image;

  UserSignupEntity({
    required this.name,
    required this.email,
    required this.password,
    required this.profileImagePath,
    required this.phone,
    required this.gender,
    this.image,
  });
}
