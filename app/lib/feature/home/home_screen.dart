import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:galileo_champions/core/app_colors.dart';
import 'package:galileo_champions/core/assets.dart';
import 'package:galileo_champions/core/dimens.dart';
import 'package:galileo_champions/core/navigation/routes.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Galileo Champions"),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("Otto Chamo"),
              accountEmail: Text("test@galileo.edu"),
              decoration: BoxDecoration(
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
              Flexible(child: Lottie.asset(AppAssets.noPointsAnim)),
              Text(
                "¡Vaya parece que cuentas con 0 puntos disponibles!",
                style: Theme.of(context).textTheme.headline5,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: AppDimens.separatorSize,
              ),
              SizedBox(
                height: AppDimens.minHeightButtons,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondary,
                  ),
                  onPressed: () {},
                  child: const Text("¿Cómo conseguir puntos?"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
