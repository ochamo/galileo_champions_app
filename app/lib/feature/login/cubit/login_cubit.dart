import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const _Initial());

  void load() {}
}

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
}
