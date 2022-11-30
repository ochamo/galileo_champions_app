import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galileo_champions/core/navigation/app_router.dart';
import 'package:galileo_champions/di/injector.dart';
import 'package:galileo_champions/feature/my_points/cubit/my_points_cubit.dart';

class MyPointsScreen extends StatelessWidget {
  const MyPointsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MyPointsCubit>(
      create: (_) => getIt.get<MyPointsCubit>()..fetchCenterPoints(),
      child: const SafeArea(child: _MyPointsScreenBody()),
    );
  }
}

class _MyPointsScreenBody extends StatefulWidget {
  const _MyPointsScreenBody({super.key});

  @override
  State<StatefulWidget> createState() => _MyPointsScreenBodyState();
}

class _MyPointsScreenBodyState extends State<_MyPointsScreenBody> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return BlocBuilder<MyPointsCubit, MyPointsCubitState>(
      builder: (context, state) {
        if (state.status == MyPointStatus.loading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Mis Champion Points"),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  var item = state.data!.data[index];
                  return Card(
                    child: ListTile(
                      title: Text(
                        item.redemptionCenter,
                        style: textTheme.headline6,
                      ),
                      subtitle: Text(
                        "Puntos acumulados: ${item.points} puntos",
                        style: textTheme.bodyLarge,
                      ),
                      onTap: () {
                        AutoRouter.of(context)
                            .push(DetailPointsRoute(id: item.id));
                      },
                    ),
                  );
                },
                itemCount: state.data != null ? state.data?.data.length : 0,
              ),
            ),
          );
        }
      },
    );
  }
}
