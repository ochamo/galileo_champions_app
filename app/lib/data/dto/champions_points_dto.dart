import 'package:json_annotation/json_annotation.dart';

part 'champions_points_dto.g.dart';

@JsonSerializable()
class ChampionsPointsDto {
  final String championPoints;

  ChampionsPointsDto({required this.championPoints});
}
