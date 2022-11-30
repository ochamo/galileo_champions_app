import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galileo_champions/core/dimens.dart';
import 'package:galileo_champions/di/injector.dart';
import 'package:galileo_champions/feature/my_profile/cubit/profile_cubit.dart';
import 'package:galileo_champions/feature/my_profile/views/profile_row.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileCubit>(
      create: (_) => getIt.get<ProfileCubit>()..loadProfile(),
      child: SafeArea(child: _MyProfileScreenBody()),
    );
  }
}

class _MyProfileScreenBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<_MyProfileScreenBody> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return BlocBuilder<ProfileCubit, ProfileCubitState>(
      builder: (context, state) {
        if (state.loading) {
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Mi perfil"),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(AppDimens.defaultPadding),
              child: Column(
                children: [
                  ProfileRow(title: "Correo", content: state.email),
                  ProfileRow(title: "Nombres", content: state.name),
                  ProfileRow(title: "Apellidos", content: state.lastname),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
