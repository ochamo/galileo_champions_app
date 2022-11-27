import 'package:flutter/material.dart';
import 'package:galileo_champions/core/app_colors.dart';
import 'package:galileo_champions/core/assets.dart';
import 'package:galileo_champions/core/dimens.dart';
import 'package:lottie/lottie.dart';

class RockstarScreen extends StatefulWidget {
  const RockstarScreen({super.key});

  @override
  State<StatefulWidget> createState() => _RockstarScreenState();
}

class _RockstarScreenState extends State<RockstarScreen> {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Galileo Rockstar"),
        centerTitle: true,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(AppDimens.defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Lottie.asset(
                  AppAssets.starAnim,
                ),
              ),
              Flexible(
                child: Text(
                  "El rockstar del momento es esa persona con la que podemos contar, un gran colaborador.",
                  style: textTheme.headline6,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: AppDimens.separatorSize,
              ),
              SizedBox(
                height: AppDimens.minHeightButtons,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Ir a nominaciones"),
                ),
              ),
              const SizedBox(
                height: AppDimens.separatorSize,
              ),
              SizedBox(
                height: AppDimens.minHeightButtons,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secondary),
                  child: const Text(
                    "¿Cómo participar?",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
