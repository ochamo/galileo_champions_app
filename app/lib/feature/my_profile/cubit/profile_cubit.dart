import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:galileo_champions/core/constants.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileCubitState> {
  final Logger logger;
  final Dio dio;
  final SharedPreferences sharedPreferences;
  ProfileCubit({
    required this.logger,
    required this.dio,
    required this.sharedPreferences,
  }) : super(const _Initial());

  void loadProfile() async {
    try {
      var token = sharedPreferences.getString(Constants.token);
      var profileResponse = await dio.get(
        Constants.profile,
        options: Options(headers: {
          "content-type": "application/json",
          "Authorization": "Bearer $token",
        }),
      );
      Map<String, dynamic> proMap = profileResponse.data ?? {};
      Map<String, dynamic> profileMap = proMap["data"];

      emit(state.copyWith(
        loading: false,
        email: profileMap["email"],
        name: profileMap["firstname"],
        lastname: profileMap["lastname"],
      ));
    } on Exception catch (e) {
      logger.e("Error al jalar la data");
      logger.e(e);
    }
  }
}

@freezed
class ProfileCubitState with _$ProfileCubitState {
  const factory ProfileCubitState.initial({
    @Default("") String email,
    @Default("") String name,
    @Default("") String lastname,
    @Default(true) bool loading,
  }) = _Initial;
}
