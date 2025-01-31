import 'package:json_annotation/json_annotation.dart';

part 'login_dto.g.dart';

@JsonSerializable()
class LoginDTO {
  final bool success;
  final String token;
  final String email;
  final String userId;

  LoginDTO({
    required this.success,
    required this.token,
    required this.email,
    required this.userId,
  });

  factory LoginDTO.fromJson(Map<String, dynamic> json) =>
      _$LoginDTOFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDTOToJson(this);
}
