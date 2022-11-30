import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:galileo_champions/core/constants.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'detail_points_cubit.freezed.dart';

enum DetailsPointsStatus {
  loading,
  fetched,
}

class DetailPointsCubit extends Cubit<DetailPointsCubitState> {
  final Logger logger;
  final Dio dio;
  final SharedPreferences sharedPreferences;
  DetailPointsCubit({
    required this.logger,
    required this.dio,
    required this.sharedPreferences,
  }) : super(const _Initial());

  void fetchPoints(int id) async {
    try {
      var token = sharedPreferences.getString(Constants.token);
      var response = await dio.get<Map<String, dynamic>>(
        "${Constants.detailPoints}/$id",
        options: Options(headers: {
          "content-type": "application/json",
          "Authorization": "Bearer $token",
        }),
      );

      Map<String, dynamic> data = response.data ?? {};

      emit(state.copyWith(
        status: DetailsPointsStatus.fetched,
        data: data["data"],
      ));

      print(response.data);
    } on Exception catch (e) {
      logger.e("Error al jalar la data");
      logger.e(e);
    }
  }
}

@freezed
class DetailPointsCubitState with _$DetailPointsCubitState {
  const factory DetailPointsCubitState.initial({
    @Default(DetailsPointsStatus.loading) DetailsPointsStatus status,
    @Default({}) Map<String, dynamic> data,
  }) = _Initial;
}
