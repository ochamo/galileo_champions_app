import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galileo_champions/core/app_colors.dart';
import 'package:galileo_champions/core/assets.dart';
import 'package:galileo_champions/core/custom_dialog.dart';
import 'package:galileo_champions/core/dimens.dart';
import 'package:galileo_champions/core/navigation/routes.dart';
import 'package:galileo_champions/feature/login/cubit/login_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: _LoginScreenBody());
  }
}

class _LoginScreenBody extends StatefulWidget {
  const _LoginScreenBody({super.key});

  @override
  State<StatefulWidget> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<_LoginScreenBody> {
  bool _hidePassword = true;

  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();

    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.formStatus == LoginFormStatus.success) {
          _goToHome();
        }

        if (state.formStatus == LoginFormStatus.failed) {
          displayDialog(
            "Error al iniciar sesión, revisa los datos ingresados o asegurate de haber verificado tu cuenta con el correo que enviamos durante el registro",
            () {
              Navigator.of(context).pop();
            },
          );
        }
      },
      builder: (context, state) {
        return state.loading
            ? const Scaffold(body: Center(child: CircularProgressIndicator()))
            : Scaffold(
                body: Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: Column(children: [
                          const Spacer(),
                          Expanded(
                            flex: 2,
                            child: Image.asset(AppAssets.logoUg),
                          ),
                          Flexible(
                            flex: 2,
                            child: TextFormField(
                              controller: emailController,
                              textInputAction: TextInputAction.next,
                              focusNode: emailFocusNode,
                              onChanged: (email) => context
                                  .read<LoginCubit>()
                                  .validateEmail(email),
                              decoration: InputDecoration(
                                hintText: "example@galileo.edu",
                                labelText: "Correo",
                                errorText: state.formStatus ==
                                        LoginFormStatus.emailError
                                    ? "Campo invalido"
                                    : null,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: AppDimens.separatorSize,
                          ),
                          Flexible(
                            flex: 2,
                            child: TextFormField(
                              controller: passwordController,
                              textInputAction: TextInputAction.done,
                              focusNode: passwordFocusNode,
                              onChanged: (password) => context
                                  .read<LoginCubit>()
                                  .validatePassword(password),
                              decoration: InputDecoration(
                                hintText: "Contraseña",
                                labelText: "Contraseña",
                                errorText: state.formStatus ==
                                        LoginFormStatus.passwordError
                                    ? "Campo invalido"
                                    : null,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _hidePassword = !_hidePassword;
                                    });
                                  },
                                  icon: _hidePassword
                                      ? const Icon(
                                          Icons.visibility,
                                        )
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
                                  onPressed: () async {
                                    await launchUrl(
                                      Uri.parse(
                                        "https://galileochampions.jaguergo.org/login",
                                      ),
                                    );
                                  },
                                  child:
                                      const Text("¿Olvidaste tú contraseña?"),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: AppDimens.separatorSize),
                          SizedBox(
                            height: AppDimens.minHeightButtons,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: ((state.formStatus ==
                                          LoginFormStatus.valid) ||
                                      (state.formStatus ==
                                          LoginFormStatus.success))
                                  ? () => sendForm()
                                  : null,
                              child: const Text("Ingresar"),
                            ),
                          ),
                          const SizedBox(height: AppDimens.separatorSize),
                          SizedBox(
                            height: AppDimens.minHeightButtons,
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.secondary,
                              ),
                              onPressed: () {
                                AutoRouter.of(context)
                                    .pushNamed(Routes.registerUser);
                              },
                              child: const Text("Registrarse"),
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ),
                ),
              );
      },
    );
  }

  void sendForm() {
    context.read<LoginCubit>().login();
  }

  void displayDialog(String message, VoidCallback callback) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext ctx) {
        return CustomDialog(
          message: message,
          callback: callback,
        );
      },
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
