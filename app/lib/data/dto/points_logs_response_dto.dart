import 'package:json_annotation/json_annotation.dart';

part 'points_logs_response_dto.g.dart';

@JsonSerializable()
class PointsLogsResponseDto {
  final int id;
  final int points;
  final String reason;
  final String modifiedBy;
  final DateTime modifiedAt;

  PointsLogsResponseDto({
    required this.id,
    required this.points,
    required this.reason,
    required this.modifiedBy,
    required this.modifiedAt,
  });

  factory PointsLogsResponseDto.fromJson(Map<String, dynamic> json) =>
      _$PointsLogsResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PointsLogsResponseDtoToJson(this);
}
