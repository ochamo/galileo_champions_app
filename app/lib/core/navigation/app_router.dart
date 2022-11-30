import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:galileo_champions/core/navigation/routes.dart';
import 'package:galileo_champions/feature/home/home_screen.dart';
import 'package:galileo_champions/feature/login/login_screen.dart';
import 'package:galileo_champions/feature/my_points/my_points_screen.dart';
import 'package:galileo_champions/feature/my_points/views/detail_points_screen.dart';
import 'package:galileo_champions/feature/my_profile/my_profile_screen.dart';
import 'package:galileo_champions/feature/register_user/register_user_screen.dart';
import 'package:galileo_champions/feature/rockstar_program/rockstar_screen.dart';
import 'package:galileo_champions/feature/splash/check_splash_screen.dart';
import 'package:galileo_champions/feature/splash/splash_screen.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(replaceInRouteName: 'Screen,Route', routes: <AutoRoute>[
  AutoRoute(path: Routes.root, page: CheckSplashScreen, initial: true),
  AutoRoute(path: Routes.splash, page: SplashScreen, initial: true),
  AutoRoute(path: Routes.registerUser, page: RegisterUserScreen),
  AutoRoute(path: Routes.home, page: HomeScreen),
  AutoRoute(path: Routes.myPoints, page: MyPointsScreen),
  AutoRoute(path: Routes.detailPoints, page: DetailPointsScreen),
  AutoRoute(path: Routes.myProfile, page: MyProfileScreen),
  AutoRoute(path: Routes.galileoRockstar, page: RockstarScreen),
  AutoRoute(path: Routes.login, page: LoginScreen),
])
class AppRouter extends _$AppRouter {}
