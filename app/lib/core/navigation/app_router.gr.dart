// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    CheckSplashRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: CheckSplashScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: SplashScreen(),
      );
    },
    RegisterUserRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const RegisterUserScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    MyPointsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const MyPointsScreen(),
      );
    },
    DetailPointsRoute.name: (routeData) {
      final args = routeData.argsAs<DetailPointsRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: DetailPointsScreen(
          key: args.key,
          id: args.id,
        ),
      );
    },
    MyProfileRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const MyProfileScreen(),
      );
    },
    RockstarRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const RockstarScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const LoginScreen(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          CheckSplashRoute.name,
          path: '/',
        ),
        RouteConfig(
          SplashRoute.name,
          path: '/splash',
        ),
        RouteConfig(
          RegisterUserRoute.name,
          path: '/register',
        ),
        RouteConfig(
          HomeRoute.name,
          path: '/home',
        ),
        RouteConfig(
          MyPointsRoute.name,
          path: '/myPoints',
        ),
        RouteConfig(
          DetailPointsRoute.name,
          path: '/detailPoints',
        ),
        RouteConfig(
          MyProfileRoute.name,
          path: '/myProfile',
        ),
        RouteConfig(
          RockstarRoute.name,
          path: '/galileoRockstar',
        ),
        RouteConfig(
          LoginRoute.name,
          path: '/login',
        ),
      ];
}

/// generated route for
/// [CheckSplashScreen]
class CheckSplashRoute extends PageRouteInfo<void> {
  const CheckSplashRoute()
      : super(
          CheckSplashRoute.name,
          path: '/',
        );

  static const String name = 'CheckSplashRoute';
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/splash',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [RegisterUserScreen]
class RegisterUserRoute extends PageRouteInfo<void> {
  const RegisterUserRoute()
      : super(
          RegisterUserRoute.name,
          path: '/register',
        );

  static const String name = 'RegisterUserRoute';
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/home',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [MyPointsScreen]
class MyPointsRoute extends PageRouteInfo<void> {
  const MyPointsRoute()
      : super(
          MyPointsRoute.name,
          path: '/myPoints',
        );

  static const String name = 'MyPointsRoute';
}

/// generated route for
/// [DetailPointsScreen]
class DetailPointsRoute extends PageRouteInfo<DetailPointsRouteArgs> {
  DetailPointsRoute({
    Key? key,
    required int id,
  }) : super(
          DetailPointsRoute.name,
          path: '/detailPoints',
          args: DetailPointsRouteArgs(
            key: key,
            id: id,
          ),
        );

  static const String name = 'DetailPointsRoute';
}

class DetailPointsRouteArgs {
  const DetailPointsRouteArgs({
    this.key,
    required this.id,
  });

  final Key? key;

  final int id;

  @override
  String toString() {
    return 'DetailPointsRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [MyProfileScreen]
class MyProfileRoute extends PageRouteInfo<void> {
  const MyProfileRoute()
      : super(
          MyProfileRoute.name,
          path: '/myProfile',
        );

  static const String name = 'MyProfileRoute';
}

/// generated route for
/// [RockstarScreen]
class RockstarRoute extends PageRouteInfo<void> {
  const RockstarRoute()
      : super(
          RockstarRoute.name,
          path: '/galileoRockstar',
        );

  static const String name = 'RockstarRoute';
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/login',
        );

  static const String name = 'LoginRoute';
}
