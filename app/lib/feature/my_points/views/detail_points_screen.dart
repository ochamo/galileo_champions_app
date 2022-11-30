import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galileo_champions/core/dimens.dart';
import 'package:galileo_champions/di/injector.dart';
import 'package:galileo_champions/feature/my_points/views/cubit/detail_points_cubit.dart';

class DetailPointsScreen extends StatelessWidget {
  final int id;

  const DetailPointsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailPointsCubit>(
      create: (_) => getIt.get<DetailPointsCubit>()..fetchPoints(id),
      child: const _DetailPointsScreenBody(),
    );
  }
}

class _DetailPointsScreenBody extends StatefulWidget {
  const _DetailPointsScreenBody({super.key});

  @override
  State<StatefulWidget> createState() => _DetailPointsScreenState();
}

class _DetailPointsScreenState extends State<_DetailPointsScreenBody> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return BlocBuilder<DetailPointsCubit, DetailPointsCubitState>(
      builder: (context, state) {
        if (state.status == DetailsPointsStatus.loading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Centro de canje ${state.data["redemptionCenter"]}",
              ),
              centerTitle: true,
            ),
            body: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimens.defaultHorizontalPadding,
                  vertical: AppDimens.defaultVerticalPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: AppDimens.separatorSize,
                    ),
                    Flexible(
                      child: Text(
                        "Champion points acumulados ${state.data["points"]}",
                        style: textTheme.headline6,
                      ),
                    ),
                    const SizedBox(
                      height: AppDimens.separatorSize,
                    ),
                    Expanded(
                      flex: 12,
                      child: ListView.builder(
                        itemCount: state.data["logs"].length,
                        itemBuilder: (context, index) {
                          var item = state.data["logs"][index];
                          return Card(
                            child: ListTile(
                              title: Text(item["reason"]),
                              subtitle: const Text(""),
                              trailing: Text(item["modifiedAt"].split("T")[0]),
                            ),
                          );
                        },
                      ),
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
