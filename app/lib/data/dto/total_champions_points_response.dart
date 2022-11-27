import 'package:galileo_champions/data/dto/champions_points_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'total_champions_points_response.g.dart';

@JsonSerializable()
class TotalChampionsPointsResponse {
  final bool success;
  final String message;
  final ChampionsPointsDto data;

  TotalChampionsPointsResponse({
    required this.success,
    required this.message,
    required this.data,
  });
}
