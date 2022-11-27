import 'package:flutter/material.dart';
import 'package:galileo_champions/core/assets.dart';
import 'package:galileo_champions/core/dimens.dart';
import 'package:lottie/lottie.dart';

class TutorialPage1 extends StatelessWidget {
  final VoidCallback nextPage;
  TutorialPage1({super.key, required this.nextPage});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            "Bienvenido a Galileo Champions",
            style: textTheme.headline4?.copyWith(color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: Lottie.asset(AppAssets.trophyAnim),
        ),
        Expanded(
          child: Text(
            "Mediante tu participación, esfuerzo y proactividad durante la clase, acumula puntos los cuales podrás canjear al final del semestre.",
            style: textTheme.headline6?.copyWith(fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: AppDimens.minHeightButtons,
          child: ElevatedButton(
            onPressed: nextPage,
            child: Text("Dime más"),
          ),
        ),
      ],
    );
  }
}
