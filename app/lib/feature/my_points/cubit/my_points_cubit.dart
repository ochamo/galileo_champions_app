import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:galileo_champions/core/constants.dart';
import 'package:galileo_champions/data/dto/group_champion_points_response_dto.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'my_points_cubit.freezed.dart';

enum MyPointStatus { loading, fetched }

class MyPointsCubit extends Cubit<MyPointsCubitState> {
  final Logger logger;
  final SharedPreferences sharedPreferences;
  final Dio dio;
  MyPointsCubit({
    required this.logger,
    required this.sharedPreferences,
    required this.dio,
  }) : super(const _Initial());

  void fetchCenterPoints() async {
    try {
      var token = sharedPreferences.getString(Constants.token);
      var response = await dio.get<Map<String, dynamic>>(
        Constants.groupPoints,
        options: Options(headers: {
          "content-type": "application/json",
          "Authorization": "Bearer $token",
        }),
      );
      GroupChampionPointsResponse data =
          GroupChampionPointsResponse.fromJson(response.data ?? {});
      emit(state.copyWith(
        status: MyPointStatus.fetched,
        data: data,
      ));
    } on Exception catch (e) {
      logger.e("Error al jalar la data");
      logger.e(e);
    }
  }
}

@freezed
class MyPointsCubitState with _$MyPointsCubitState {
  const factory MyPointsCubitState.initial({
    @Default(MyPointStatus.loading) status,
    GroupChampionPointsResponse? data,
  }) = _Initial;
}
