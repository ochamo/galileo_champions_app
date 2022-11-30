import 'package:galileo_champions/data/dto/points_logs_response_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'group_champion_points_response_item_dto.g.dart';

@JsonSerializable()
class GroupChampionPointsResponseItemDto {
  final int id;
  final String redemptionCenter;
  final String student;
  final int year;
  final int points;
  final String reason;
  final String modifiedBy;
  final String modifiedAt;
  @JsonKey(includeIfNull: false)
  final List<PointsLogsResponseDto>? logs;

  GroupChampionPointsResponseItemDto({
    required this.id,
    required this.redemptionCenter,
    required this.student,
    required this.year,
    required this.points,
    required this.reason,
    required this.modifiedBy,
    required this.modifiedAt,
    required this.logs,
  });

  factory GroupChampionPointsResponseItemDto.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$GroupChampionPointsResponseItemDtoFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GroupChampionPointsResponseItemDtoToJson(this);
}
