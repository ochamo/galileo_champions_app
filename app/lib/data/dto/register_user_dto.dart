import 'package:json_annotation/json_annotation.dart';

part 'register_user_dto.g.dart';

@JsonSerializable()
class RegisterUserDto {
  final String email;
  final String firstname;
  final String lastname;
  final String password;

  RegisterUserDto({
    required this.email,
    required this.firstname,
    required this.lastname,
    required this.password,
  });

  factory RegisterUserDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterUserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterUserDtoToJson(this);
}
