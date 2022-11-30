import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galileo_champions/core/app_colors.dart';
import 'package:galileo_champions/core/custom_dialog.dart';
import 'package:galileo_champions/core/dimens.dart';
import 'package:galileo_champions/di/injector.dart';
import 'package:galileo_champions/feature/register_user/cubit/register_user_cubit.dart';
import 'package:galileo_champions/feature/register_user/register_form_status.dart';

class RegisterUserScreen extends StatelessWidget {
  const RegisterUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterUserCubit>(
      create: (_) => getIt.get<RegisterUserCubit>(),
      child: const _RegisterUserScreenBody(),
    );
  }
}

class _RegisterUserScreenBody extends StatefulWidget {
  const _RegisterUserScreenBody({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterUserScreenBodyState();
}

class _RegisterUserScreenBodyState extends State<_RegisterUserScreenBody> {
  final _emailController = TextEditingController();
  final _namesController = TextEditingController();
  final _lastnamesController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _hidePassword = true;
  bool _hideConfirmPassword = true;

  late FocusNode emailFocusNode;
  late FocusNode namesFocusNode;
  late FocusNode lastnamesFocusNode;
  late FocusNode passwordFocusNode;
  late FocusNode confirmPasswordFocusNode;

  @override
  void initState() {
    super.initState();
    emailFocusNode = FocusNode();
    namesFocusNode = FocusNode();
    lastnamesFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    confirmPasswordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    emailFocusNode.dispose();
    namesFocusNode.dispose();
    lastnamesFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Crear cuenta"),
        centerTitle: true,
      ),
      body: BlocConsumer<RegisterUserCubit, RegisterCubitState>(
        listener: (context, state) {
          if (state.formStatus == RegisterFormStatus.failed) {
            displayDialog(
              "Ha ocurrido un error en la creación de la cuenta, verifica los datos.",
              () {
                Navigator.of(context).pop();
              },
            );
          }

          if (state.formStatus == RegisterFormStatus.success) {
            displayDialog(
              "Se ha creado la cuenta, recibiras un correo para verificar tu cuenta",
              () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            );
          }
        },
        builder: (context, state) {
          return state.loading
              ? const Center(child: CircularProgressIndicator())
              : Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: Column(children: [
                          const Spacer(),
                          Flexible(
                            flex: 2,
                            child: TextFormField(
                              controller: _emailController,
                              focusNode: emailFocusNode,
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (value) {
                                emailFocusNode.unfocus();
                                FocusScope.of(context)
                                    .requestFocus(namesFocusNode);
                              },
                              onChanged: (email) => context
                                  .read<RegisterUserCubit>()
                                  .validateEmail(email),
                              decoration: InputDecoration(
                                hintText: "example@galileo.edu",
                                labelText: "Correo",
                                errorText: state.formStatus ==
                                        RegisterFormStatus.emailInvalid
                                    ? "Correo invalido"
                                    : null,
                              ),
                            ),
                          ),
                          const SizedBox(height: AppDimens.separatorSize),
                          Flexible(
                            flex: 2,
                            child: TextFormField(
                              controller: _namesController,
                              focusNode: namesFocusNode,
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (value) {
                                namesFocusNode.unfocus();
                                FocusScope.of(context)
                                    .requestFocus(lastnamesFocusNode);
                              },
                              onChanged: (names) => context
                                  .read<RegisterUserCubit>()
                                  .validateNames(names),
                              decoration: InputDecoration(
                                labelText: "Nombres",
                                errorText: state.formStatus ==
                                        RegisterFormStatus.namesInvalid
                                    ? "Campo invalido"
                                    : null,
                              ),
                            ),
                          ),
                          const SizedBox(height: AppDimens.separatorSize),
                          Flexible(
                            flex: 2,
                            child: TextFormField(
                              focusNode: lastnamesFocusNode,
                              controller: _lastnamesController,
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (value) {
                                lastnamesFocusNode.unfocus();
                                FocusScope.of(context)
                                    .requestFocus(passwordFocusNode);
                              },
                              onChanged: (lastnames) => context
                                  .read<RegisterUserCubit>()
                                  .validateLastnames(lastnames),
                              decoration: InputDecoration(
                                labelText: "Apellidos",
                                errorText: state.formStatus ==
                                        RegisterFormStatus.lastnamesInvalid
                                    ? "Campo invalido"
                                    : null,
                              ),
                            ),
                          ),
                          const SizedBox(height: AppDimens.separatorSize),
                          Flexible(
                            flex: 2,
                            child: TextFormField(
                              focusNode: passwordFocusNode,
                              controller: _passwordController,
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (value) {
                                passwordFocusNode.unfocus();
                                FocusScope.of(context)
                                    .requestFocus(confirmPasswordFocusNode);
                              },
                              onChanged: (password) => context
                                  .read<RegisterUserCubit>()
                                  .validatePassword(password),
                              decoration: InputDecoration(
                                hintText: "Contraseña",
                                labelText: "Contraseña",
                                errorText: state.formStatus ==
                                        RegisterFormStatus.passwordInvalid
                                    ? "Campo invalido"
                                    : null,
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
                          const SizedBox(height: AppDimens.separatorSize),
                          Flexible(
                            flex: 2,
                            child: TextFormField(
                              focusNode: confirmPasswordFocusNode,
                              controller: _confirmPasswordController,
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (value) {
                                confirmPasswordFocusNode.unfocus();
                              },
                              onChanged: (password) => context
                                  .read<RegisterUserCubit>()
                                  .validatePasswordConfirm(password),
                              decoration: InputDecoration(
                                hintText: "Confirmar contraseña",
                                labelText: "Confirmar contraseña",
                                errorText: state.formStatus ==
                                        RegisterFormStatus.passwordMismatch
                                    ? "Campo invalido"
                                    : null,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _hideConfirmPassword =
                                          !_hideConfirmPassword;
                                    });
                                  },
                                  icon: _hideConfirmPassword
                                      ? const Icon(Icons.visibility)
                                      : const Icon(Icons.visibility_off),
                                ),
                              ),
                              obscureText: _hideConfirmPassword,
                            ),
                          ),
                          const SizedBox(height: AppDimens.separatorSize),
                          const SizedBox(height: AppDimens.separatorSize),
                          SizedBox(
                            width: double.infinity,
                            height: AppDimens.minHeightButtons,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.secondary,
                              ),
                              onPressed: ((state.formStatus ==
                                          RegisterFormStatus.valid) ||
                                      (state.formStatus ==
                                          RegisterFormStatus.success))
                                  ? () => sendForm()
                                  : null,
                              child: const Text("Registrarme"),
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }

  void sendForm() {
    context.read<RegisterUserCubit>().createAccount();
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
}
