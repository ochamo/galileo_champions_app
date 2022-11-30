import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:galileo_champions/core/constants.dart';
import 'package:galileo_champions/data/dto/login_request_dto.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_cubit.freezed.dart';

enum LoginFormStatus {
  valid,
  failed,
  success,
  empty,
  emailError,
  passwordError,
}

class LoginCubit extends Cubit<LoginState> {
  final Logger logger;
  final SharedPreferences sharedPreferences;
  final Dio dio;

  LoginCubit({
    required this.logger,
    required this.sharedPreferences,
    required this.dio,
  }) : super(const _Initial());

  void login() async {
    emit(state.copyWith(loading: true));
    try {
      var loginDto = LoginRequestDto(
        username: state.email,
        password: state.password,
        grantType: "password",
        clientId: "8516102001669138343",
        clientSecret:
            "\$2a\$10\$ku5xnYJ4wfHcUNbvPGcyi.QejnX7NfHjm/3bLB7HM.SMOeQKSz9pW",
      );

      var response = await dio.post<Map<String, dynamic>>(
        Constants.loginEndpoint,
        data: loginDto.toJson(),
        options: Options(headers: {"content-type": "application/json"}),
      );
      Map<String, dynamic>? map = response.data;

      if (map != null) {
        sharedPreferences.setString(Constants.token, map["access_token"]);
        emit(state.copyWith(
          formStatus: LoginFormStatus.success,
          loading: false,
        ));
      }
    } on Exception catch (e) {
      logger.e("Fallo en login");
      emit(state.copyWith(
        formStatus: LoginFormStatus.failed,
        loading: false,
      ));
      if (e is DioError) {
        print(e.response);
      }
    }
  }

  void validateEmail(String email) {
    if (email.isEmpty) {
      emit(state.copyWith(
        email: email,
        formStatus: LoginFormStatus.emailError,
      ));

      return;
    } else {
      emit(state.copyWith(email: email, formStatus: LoginFormStatus.empty));
      _formValid();
    }
  }

  void validatePassword(String password) {
    if (password.isEmpty) {
      emit(state.copyWith(
        password: password,
        formStatus: LoginFormStatus.passwordError,
      ));
      return;
    } else {
      emit(state.copyWith(
        password: password,
        formStatus: LoginFormStatus.empty,
      ));
      _formValid();
    }
  }

  void _formValid() {
    if (state.email.isNotEmpty && state.password.isNotEmpty) {
      emit(state.copyWith(formStatus: LoginFormStatus.valid));
    }
  }
}

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState.initial({
    @Default("") String email,
    @Default("") String password,
    @Default(false) bool loading,
    @Default(LoginFormStatus.empty) LoginFormStatus formStatus,
  }) = _Initial;
}
