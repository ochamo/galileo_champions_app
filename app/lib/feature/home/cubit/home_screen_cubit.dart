import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:galileo_champions/core/constants.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'home_screen_cubit.freezed.dart';

enum HomeScreenStatus {
  loading,
  error,
  noPoints,
  hasPoints,
}

class HomeScreenCubit extends Cubit<HomeScreenCubitState> {
  final Logger logger;
  final Dio dio;
  final SharedPreferences sharedPreferences;
  HomeScreenCubit({
    required this.logger,
    required this.dio,
    required this.sharedPreferences,
  }) : super(const _Initial());

  void getUserPoints() async {
    try {
      var token = sharedPreferences.getString(Constants.token);
      var response = await dio.get(
        Constants.totalPointsEndpoint,
        options: Options(headers: {
          "content-type": "application/json",
          "Authorization": "Bearer $token",
        }),
      );
      var profileResponse = await dio.get(
        Constants.profile,
        options: Options(headers: {
          "content-type": "application/json",
          "Authorization": "Bearer $token",
        }),
      );

      Map<String, dynamic>? map = response.data;
      Map<String, dynamic>? proMap = profileResponse.data;
      if (map != null && proMap != null) {
        Map<String, dynamic> profileMap = proMap["data"];
        String points = map["data"]["championPoints"];
        if (int.parse(points) > 0) {
          emit(state.copyWith(
            status: HomeScreenStatus.hasPoints,
            email: profileMap["email"],
            username: "${profileMap["firstname"]} ${profileMap["lastname"]}",
            message: "¡Vaya parece que cuentas con $points puntos disponibles!",
          ));
        } else {
          emit(state.copyWith(
            status: HomeScreenStatus.noPoints,
            email: profileMap["email"],
            username: "${profileMap["firstname"]} ${profileMap["lastname"]}",
            message: "¡Vaya parece que cuentas con 0 puntos disponibles!",
          ));
        }
      }
    } on Exception catch (e) {
      logger.e("Error al jalar la data");
      logger.e(e);
      emit(state.copyWith(
        status: HomeScreenStatus.error,
        message: "No se pudieron cargar los puntos.",
      ));
    }
  }
}

@freezed
class HomeScreenCubitState with _$HomeScreenCubitState {
  const factory HomeScreenCubitState.initial({
    @Default("") String message,
    @Default("") String username,
    @Default("") String email,
    @Default(HomeScreenStatus.loading) HomeScreenStatus status,
  }) = _Initial;
}
