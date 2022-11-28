import 'package:json_annotation/json_annotation.dart';

part 'register_user_dto.g.dart';

@JsonSerializable()
class RegisterUserDto {
  @JsonKey(name: "email")
  final String email;
  @JsonKey(name: "firstname")
  final String firstname;
  @JsonKey(name: "lastname")
  final String lastname;
  @JsonKey(name: "password")
  final String password;
  @JsonKey(name: "isVerified")
  final bool isVerified;

  RegisterUserDto({
    required this.email,
    required this.firstname,
    required this.lastname,
    required this.password,
    this.isVerified = true,
  });

  factory RegisterUserDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterUserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterUserDtoToJson(this);
}
