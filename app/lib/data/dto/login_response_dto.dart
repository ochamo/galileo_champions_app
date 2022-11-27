import 'package:json_annotation/json_annotation.dart';

part 'login_response_dto.g.dart';

@JsonSerializable()
class LoginResponseDto {
  @JsonKey(name: "token_type")
  final String tokenType;
  @JsonKey(name: "access_token")
  final String accessToken;
  @JsonKey(name: "expires_in")
  final int expiresIn;

  LoginResponseDto({
    required this.tokenType,
    required this.accessToken,
    required this.expiresIn,
  });

  factory LoginResponseDto.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseDtoToJson(this);
}
