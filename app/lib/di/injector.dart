import 'package:dio/dio.dart';
import 'package:galileo_champions/core/constants.dart';
import 'package:galileo_champions/core/navigation/app_router.dart';
import 'package:galileo_champions/feature/login/cubit/login_cubit.dart';
import 'package:galileo_champions/feature/register_user/cubit/register_user_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

final getIt = GetIt.instance;

Future<void> initializeInjectedDependencies() async {
  getIt.registerSingleton<Logger>(Logger());
  getIt.registerSingleton(AppRouter());

  getIt.registerFactory(() => LoginCubit());

  getIt.registerSingleton<Dio>(Dio(BaseOptions(baseUrl: Constants.baseUrl)));
  getIt.registerFactory<RegisterUserCubit>(
    () => RegisterUserCubit(logger: getIt.get(), dio: getIt.get()),
  );
}
