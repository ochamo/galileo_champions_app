import 'package:json_annotation/json_annotation.dart';

part 'champions_points_dto.g.dart';

@JsonSerializable()
class ChampionsPointsDto {
  final String championPoints;

  ChampionsPointsDto({required this.championPoints});

  factory ChampionsPointsDto.fromJson(Map<String, dynamic> json) =>
      _$ChampionsPointsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ChampionsPointsDtoToJson(this);
}
