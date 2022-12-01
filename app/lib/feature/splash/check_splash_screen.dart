import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:galileo_champions/core/constants.dart';
import 'package:galileo_champions/core/navigation/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckSplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CheckSplashScreenState();
}

class _CheckSplashScreenState extends State<CheckSplashScreen> {
  @override
  void initState() {
    super.initState();
    checkSplash();
  }

  @override
  Widget build(BuildContext context0) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  void checkSplash() async {
    final prefs = await SharedPreferences.getInstance();
    final bool hideSplash = prefs.getBool(Constants.hideSplash) ?? false;

    if (hideSplash) {
      hideScreen();
    } else {
      AutoRouter.of(context).replaceNamed(Routes.splash);
    }
  }

  void hideScreen() async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.getString(Constants.token) == null) {
      AutoRouter.of(context).replaceNamed(Routes.login);
    } else {
      AutoRouter.of(context).replaceNamed(Routes.home);
    }
  }
}
