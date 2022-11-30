import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:galileo_champions/core/constants.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'rockstar_screen_cubit.freezed.dart';

enum RockStarScreenStatus { loading, rockstar, notRockstar }

class RockstarScreenCubit extends Cubit<RockstarScreenCubitState> {
  final Logger logger;
  final Dio dio;
  final SharedPreferences sharedPreferences;
  RockstarScreenCubit({
    required this.logger,
    required this.dio,
    required this.sharedPreferences,
  }) : super(const _Initial());

  void getRockstar() async {
    try {
      var token = sharedPreferences.getString(Constants.token);
      var response = await dio.get<Map<String, dynamic>>(
        Constants.rockstarInfo,
        options: Options(
          headers: {
            "content-type": "application/json",
            "Authorization": "Bearer $token",
          },
        ),
      );

      Map<String, dynamic> map = response.data ?? {};

      if (map["data"] == true) {
        emit(state.copyWith(
          isRockstar: true,
          status: RockStarScreenStatus.rockstar,
        ));
      }
    } on Exception catch (e) {
      logger.e("Error al jalar los datos");
      logger.e(e);
      emit(state.copyWith(
        isRockstar: false,
        status: RockStarScreenStatus.notRockstar,
      ));
    }
  }
}

@freezed
class RockstarScreenCubitState with _$RockstarScreenCubitState {
  const factory RockstarScreenCubitState.initial({
    @Default(RockStarScreenStatus.loading) RockStarScreenStatus status,
    @Default(false) bool isRockstar,
  }) = _Initial;
}
