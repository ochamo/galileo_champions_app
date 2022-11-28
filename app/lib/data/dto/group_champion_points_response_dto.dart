import 'package:galileo_champions/data/dto/group_champion_points_response_item_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'group_champion_points_response_dto.g.dart';

@JsonSerializable()
class GroupChampionPointsResponse {
  final bool success;
  final String message;
  final List<GroupChampionPointsResponseItemDto> data;

  GroupChampionPointsResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory GroupChampionPointsResponse.fromJson(Map<String, dynamic> json) =>
      _$GroupChampionPointsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GroupChampionPointsResponseToJson(this);
}
