import 'package:galileo_champions/core/navigation/app_router.dart';
import 'package:galileo_champions/feature/login/cubit/login_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

final getIt = GetIt.instance;

Future<void> initializeInjectedDepedencies() async {
  getIt.registerSingleton(() => Logger());
  getIt.registerSingleton(AppRouter());

  getIt.registerFactory(() => LoginCubit());
}
