import 'package:json_annotation/json_annotation.dart';

part 'login_request_dto.g.dart';

@JsonSerializable()
class LoginRequestDto {
  final String username;
  final String password;
  @JsonKey(name: "grant_type")
  final String grantType;
  @JsonKey(name: "client_id")
  final String clientId;
  @JsonKey(name: "client_secret")
  final String clientSecret;

  LoginRequestDto({
    required this.username,
    required this.password,
    required this.grantType,
    required this.clientId,
    required this.clientSecret,
  });

  factory LoginRequestDto.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestDtoToJson(this);
}
