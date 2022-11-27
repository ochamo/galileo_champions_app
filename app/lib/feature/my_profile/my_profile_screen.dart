import 'package:flutter/material.dart';
import 'package:galileo_champions/core/dimens.dart';
import 'package:galileo_champions/feature/my_profile/views/profile_row.dart';

class MyProfileScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mi perfil"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppDimens.defaultPadding),
        child: Column(
          children: const [
            ProfileRow(title: "Correo", content: "samantha@galileo.edu"),
            ProfileRow(title: "Nombres", content: "Samantha Colette"),
            ProfileRow(title: "Apellidos", content: "Rodas Chaluleu"),
          ],
        ),
      ),
    );
  }
}
