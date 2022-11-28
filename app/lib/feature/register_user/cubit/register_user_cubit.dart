import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:galileo_champions/core/constants.dart';
import 'package:galileo_champions/data/dto/register_user_dto.dart';
import 'package:galileo_champions/feature/register_user/register_form_status.dart';
import 'package:logger/logger.dart';

part 'register_user_cubit.freezed.dart';

class RegisterUserCubit extends Cubit<RegisterCubitState> {
  final Logger logger;
  final Dio dio;

  RegisterUserCubit({
    required this.logger,
    required this.dio,
  }) : super(const RegisterCubitState.current());

  void createAccount() async {
    try {
      var registerUserDto = RegisterUserDto(
        email: state.email,
        firstname: state.names,
        lastname: state.lastnames,
        password: state.password,
      );
      var response = await dio.post<Map<String, dynamic>>(
        Constants.registerUserEndpoint,
        data: registerUserDto.toJson(),
        options: Options(headers: {"content-type": "application/json"}),
      );
      Map<String, dynamic> map = response.data ?? {};
      if (map["success"]) {
        print("hello");
      }
    } on Exception catch (e) {
      logger.e("Error al registrar el usuario");
      logger.e(e);
    }
  }

  void validateEmail(String email) {
    if (email.isEmpty) {
      emit(state.copyWith(
        email: email,
        formStatus: RegisterFormStatus.emailInvalid,
      ));
      return;
    } else {
      emit(state.copyWith(email: email, formStatus: RegisterFormStatus.empty));
    }
    _formValid();
  }

  void validateNames(String names) {
    if (names.isEmpty) {
      emit(state.copyWith(
        names: names,
        formStatus: RegisterFormStatus.namesInvalid,
      ));
      return;
    } else {
      emit(state.copyWith(names: names, formStatus: RegisterFormStatus.empty));
    }
    _formValid();
  }

  void validateLastnames(String lastnames) {
    if (lastnames.isEmpty) {
      emit(state.copyWith(
        lastnames: lastnames,
        formStatus: RegisterFormStatus.lastnamesInvalid,
      ));
    } else {
      emit(state.copyWith(
        lastnames: lastnames,
        formStatus: RegisterFormStatus.empty,
      ));
    }
    _formValid();
  }

  void validatePassword(String password) {
    if (password.isEmpty) {
      emit(state.copyWith(
        password: password,
        formStatus: RegisterFormStatus.passwordInvalid,
      ));
      return;
    } else {
      emit(state.copyWith(
        password: password,
        formStatus: RegisterFormStatus.empty,
      ));
    }
    _formValid();
  }

  void validatePasswordConfirm(String password) {
    print(state);

    if (password.isEmpty) {
      emit(state.copyWith(
        confirmPassword: password,
        formStatus: RegisterFormStatus.passwordMismatch,
      ));
      return;
    } else {
      if (state.password != password) {
        emit(state.copyWith(
          confirmPassword: password,
          formStatus: RegisterFormStatus.passwordMismatch,
        ));
        return;
      }
      emit(state.copyWith(
        confirmPassword: password,
        formStatus: RegisterFormStatus.empty,
      ));
      _formValid();
    }
  }

  void _formValid() {
    if (state.email.isNotEmpty &&
        state.names.isNotEmpty &&
        state.lastnames.isNotEmpty) {
      if (state.confirmPassword == state.password) {
        emit(state.copyWith(formStatus: RegisterFormStatus.valid));
      }
    }
  }
}

@freezed
class RegisterCubitState with _$RegisterCubitState {
  const factory RegisterCubitState.current({
    @Default("") String email,
    @Default("") String password,
    @Default("") String confirmPassword,
    @Default("") String names,
    @Default("") String lastnames,
    @Default(RegisterFormStatus.empty) RegisterFormStatus formStatus,
    @Default("") String message,
    @Default(false) bool loading,
  }) = _Current;
}
