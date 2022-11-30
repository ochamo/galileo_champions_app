import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galileo_champions/core/assets.dart';
import 'package:galileo_champions/core/dimens.dart';
import 'package:galileo_champions/di/injector.dart';
import 'package:galileo_champions/feature/rockstar_program/cubit/rockstar_screen_cubit.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class RockstarScreen extends StatelessWidget {
  const RockstarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RockstarScreenCubit>(
      create: (_) => getIt.get<RockstarScreenCubit>()..getRockstar(),
      child: const SafeArea(child: _RockstarScreenBody()),
    );
  }
}

class _RockstarScreenBody extends StatefulWidget {
  const _RockstarScreenBody({super.key});

  @override
  State<StatefulWidget> createState() => _RockstarScreenState();
}

class _RockstarScreenState extends State<_RockstarScreenBody> {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return BlocBuilder<RockstarScreenCubit, RockstarScreenCubitState>(
      builder: (context, state) {
        if (state.status == RockStarScreenStatus.loading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else {
          String anim = "";
          if (state.isRockstar) {
            anim = AppAssets.starAnim;
          } else {
            anim = AppAssets.noPointsAnim;
          }
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
                        anim,
                      ),
                    ),
                    Flexible(
                      child: Text(
                        state.isRockstar
                            ? "¡Felicidades has ganado el rockstar del periodo actual!"
                            : "El rockstar del momento es esa persona con la que podemos contar, un gran colaborador.",
                        style: textTheme.headline6,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    !state.isRockstar
                        ? const SizedBox(
                            height: AppDimens.separatorSize,
                          )
                        : const SizedBox.shrink(),
                    !state.isRockstar
                        ? SizedBox(
                            height: AppDimens.minHeightButtons,
                            child: ElevatedButton(
                              onPressed: () async {
                                await launchUrl(
                                  Uri.parse(
                                    "https://galileochampions.jaguergo.org/rockstar-form",
                                  ),
                                );
                              },
                              child: const Text("Ir a nominaciones"),
                            ),
                          )
                        : const SizedBox.shrink(),
                    !state.isRockstar
                        ? const SizedBox(
                            height: AppDimens.separatorSize,
                          )
                        : const SizedBox.shrink(),
                    /*!state.isRockstar
                        ? const SizedBox.shrink()
                        : SizedBox(
                            height: AppDimens.minHeightButtons,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.secondary),
                              child: const Text(
                                "¿Cómo participar?",
                              ),
                            ),
                          ),*/
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
