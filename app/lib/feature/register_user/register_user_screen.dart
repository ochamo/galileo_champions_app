import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:galileo_champions/core/app_colors.dart';
import 'package:galileo_champions/core/dimens.dart';

class RegisterUserScreen extends StatefulWidget {
  const RegisterUserScreen({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterUserScreenState();
}

class _RegisterUserScreenState extends State<RegisterUserScreen> {
  bool _hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Crear cuenta"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  const Spacer(),
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
                      decoration: const InputDecoration(
                        labelText: "Nombres",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: AppDimens.separatorSize,
                  ),
                  Flexible(
                    flex: 2,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Apellidos",
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
                    flex: 2,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Confirmar contraseña",
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
                  const SizedBox(
                    height: AppDimens.separatorSize,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: AppDimens.minHeightButtons,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.secondary,
                      ),
                      onPressed: () {},
                      child: const Text("Registrarme"),
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
}
