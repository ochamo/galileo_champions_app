import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galileo_champions/core/assets.dart';
import 'package:galileo_champions/core/dimens.dart';
import 'package:galileo_champions/core/navigation/routes.dart';
import 'package:galileo_champions/di/injector.dart';
import 'package:galileo_champions/feature/home/cubit/home_screen_cubit.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeScreenCubit>(
      create: (_) => getIt.get<HomeScreenCubit>()..getUserPoints(),
      child: const SafeArea(child: _HomeScreenBody()),
    );
  }
}

class _HomeScreenBody extends StatefulWidget {
  const _HomeScreenBody({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<_HomeScreenBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenCubit, HomeScreenCubitState>(
      builder: (context, state) {
        if (state.status == HomeScreenStatus.loading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          String anim = "";
          if (state.status == HomeScreenStatus.hasPoints) {
            anim = AppAssets.hasPointsAnim;
          }

          if (state.status == HomeScreenStatus.noPoints) {
            anim = AppAssets.noPointsAnim;
          }

          return Scaffold(
            appBar: AppBar(
              title: const Text("Galileo Champions"),
              centerTitle: true,
            ),
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  UserAccountsDrawerHeader(
                    accountName: Text(state.username),
                    accountEmail: Text(state.email),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://infoguatemala.org/wp-content/uploads/2022/08/Universidad-Galileo-de-Guatemala-768x537.webp",
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.home),
                    title: const Text("Home"),
                    onTap: () {
                      AutoRouter.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.numbers),
                    title: const Text("Mis Champion points"),
                    onTap: () {
                      AutoRouter.of(context).pop();
                      AutoRouter.of(context).pushNamed(Routes.myPoints);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.star),
                    title: const Text("Galileo Rockstar"),
                    onTap: () {
                      AutoRouter.of(context).pop();
                      AutoRouter.of(context).pushNamed(Routes.galileoRockstar);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.account_circle),
                    title: const Text("Mi perfil"),
                    onTap: () {
                      AutoRouter.of(context).pop();
                      AutoRouter.of(context).pushNamed(Routes.myProfile);
                    },
                  ),
                ],
              ),
            ),
            body: SizedBox(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(child: Lottie.asset(anim)),
                    Text(
                      state.message,
                      style: Theme.of(context).textTheme.headline5,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: AppDimens.separatorSize,
                    ),
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
