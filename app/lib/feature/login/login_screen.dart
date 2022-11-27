import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:galileo_champions/core/app_colors.dart';
import 'package:galileo_champions/core/assets.dart';
import 'package:galileo_champions/core/dimens.dart';
import 'package:galileo_champions/core/navigation/routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  const Spacer(),
                  Expanded(
                    flex: 2,
                    child: Image.asset(AppAssets.logoUg),
                  ),
                  Flexible(
                    flex: 2,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: "example@galileo.edu",
                        labelText: "Correo",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: AppDimens.separatorSize,
                  ),
                  Flexible(
                    flex: 2,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Contraseña",
                        labelText: "Contraseña",
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _hidePassword = !_hidePassword;
                            });
                          },
                          icon: _hidePassword
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                        ),
                      ),
                      obscureText: _hidePassword,
                    ),
                  ),
                  const SizedBox(
                    height: AppDimens.separatorSize,
                  ),
                  Flexible(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text("¿Olvidaste tú contraseña?"),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: AppDimens.separatorSize,
                  ),
                  SizedBox(
                    height: AppDimens.minHeightButtons,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        _goToHome();
                      },
                      child: const Text("Ingresar"),
                    ),
                  ),
                  const SizedBox(
                    height: AppDimens.separatorSize,
                  ),
                  SizedBox(
                    height: AppDimens.minHeightButtons,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.secondary,
                      ),
                      onPressed: () {
                        AutoRouter.of(context).pushNamed(Routes.registerUser);
                      },
                      child: const Text("Registrarse"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _goToHome() {
    AutoRouter.of(context).replaceNamed(Routes.home);
    precacheImage(
      Image.network(
        "https://infoguatemala.org/wp-content/uploads/2022/08/Universidad-Galileo-de-Guatemala-768x537.webp",
      ).image,
      context,
    );
  }
}
