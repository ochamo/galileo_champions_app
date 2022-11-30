import 'package:dio/dio.dart';
import 'package:galileo_champions/core/constants.dart';
import 'package:galileo_champions/core/navigation/app_router.dart';
import 'package:galileo_champions/feature/home/cubit/home_screen_cubit.dart';
import 'package:galileo_champions/feature/login/cubit/login_cubit.dart';
import 'package:galileo_champions/feature/my_points/cubit/my_points_cubit.dart';
import 'package:galileo_champions/feature/my_points/views/cubit/detail_points_cubit.dart';
import 'package:galileo_champions/feature/my_profile/cubit/profile_cubit.dart';
import 'package:galileo_champions/feature/register_user/cubit/register_user_cubit.dart';
import 'package:galileo_champions/feature/rockstar_program/cubit/rockstar_screen_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> initializeInjectedDependencies() async {
  getIt.registerSingleton<Logger>(Logger());
  getIt.registerSingleton(AppRouter());
  getIt.registerSingleton<Dio>(Dio(BaseOptions(baseUrl: Constants.baseUrl)));
  getIt.registerSingleton<SharedPreferences>(
    await SharedPreferences.getInstance(),
  );

  getIt.registerFactory(() => LoginCubit(
        logger: getIt.get(),
        sharedPreferences: getIt.get(),
        dio: getIt.get(),
      ));
  getIt.registerFactory<RegisterUserCubit>(
    () => RegisterUserCubit(logger: getIt.get(), dio: getIt.get()),
  );
  getIt.registerFactory(() => HomeScreenCubit(
        logger: getIt.get(),
        dio: getIt.get(),
        sharedPreferences: getIt.get(),
      ));

  getIt.registerFactory(() => MyPointsCubit(
        logger: getIt.get(),
        dio: getIt.get(),
        sharedPreferences: getIt.get(),
      ));

  getIt.registerFactory(() => DetailPointsCubit(
        logger: getIt.get(),
        dio: getIt.get(),
        sharedPreferences: getIt.get(),
      ));
  getIt.registerFactory(() => RockstarScreenCubit(
        logger: getIt.get(),
        dio: getIt.get(),
        sharedPreferences: getIt.get(),
      ));

  getIt.registerFactory(() => ProfileCubit(
        logger: getIt.get(),
        dio: getIt.get(),
        sharedPreferences: getIt.get(),
      ));
}
