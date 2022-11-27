import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:galileo_champions/core/assets.dart';
import 'package:galileo_champions/core/dimens.dart';
import 'package:galileo_champions/core/navigation/routes.dart';
import 'package:lottie/lottie.dart';

class TutorialPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            "Galileo Rockstar",
            style: textTheme.headline4?.copyWith(color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: Lottie.asset(AppAssets.starAnim),
        ),
        Expanded(
          child: Text(
            "Un programa que promueve el crecimiento personal de los estudiantes al apoyar a otros fuera de tu promoción, lucha por ser nominado y contar con la posibilidad de ganar puntos netos que pueden ser redimibles en cualquier clase a tu elección.",
            style: textTheme.headline6?.copyWith(fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: AppDimens.minHeightButtons,
          child: ElevatedButton(
            onPressed: () {
              AutoRouter.of(context).replaceNamed(Routes.login);
            },
            child: Text("Continuar"),
          ),
        ),
      ],
    );
  }
}
