import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galileo_champions/core/app_colors.dart';
import 'package:galileo_champions/core/navigation/app_router.dart';
import 'package:galileo_champions/di/injector.dart';
import 'package:galileo_champions/feature/login/cubit/login_cubit.dart';

class App extends StatefulWidget {
  final AppRouter appRouter;

  App({
    Key? key,
    AppRouter? appRouter,
  })  : appRouter = appRouter ?? getIt<AppRouter>(),
        super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    checkSplash();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Galileo Champions',
      routeInformationParser: widget.appRouter.defaultRouteParser(),
      routerDelegate: AutoRouterDelegate(
        widget.appRouter,
      ),
      builder: (context, child) {
        final MediaQueryData mediaQueryData = MediaQuery.of(context);

        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => getIt.get<LoginCubit>()),
          ],
          child: MediaQuery(
            data: mediaQueryData.copyWith(textScaleFactor: 1.0),
            child: child ?? const SizedBox.shrink(),
          ),
        );
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: AppColors.primary,
          secondary: AppColors.secondary,
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 96,
            fontWeight: FontWeight.w600,
            letterSpacing: -1.5,
          ),
          headline2: TextStyle(
            fontSize: 60,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.5,
          ),
          headline3: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.w600,
            letterSpacing: 0,
          ),
          headline4: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.25,
          ),
          headline5: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            letterSpacing: 0,
          ),
          headline6: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.15,
          ),
          subtitle1: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.15,
          ),
          subtitle2: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.1,
          ),
          bodyText1: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.5,
          ),
          bodyText2: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.25,
          ),
          button: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.25,
          ),
          caption: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.4,
          ),
          overline: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            letterSpacing: 1.5,
          ),
        ),
      ),
    );
  }

  void checkSplash() async {}
}
