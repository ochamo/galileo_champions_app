import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:galileo_champions/core/dimens.dart';

class DetailPointsScreen extends StatefulWidget {
  const DetailPointsScreen({super.key});

  @override
  State<StatefulWidget> createState() => _DetailPointsScreenState();
}

class _DetailPointsScreenState extends State<DetailPointsScreen> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Centro de canje X"),
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
              Flexible(
                child: Text(
                  "Administrado por Axel",
                  style: textTheme.headline5,
                ),
              ),
              const SizedBox(
                height: AppDimens.separatorSize,
              ),
              Flexible(
                child: Text(
                  "Champion points acumulados 15",
                  style: textTheme.headline6,
                ),
              ),
              const SizedBox(
                height: AppDimens.separatorSize,
              ),
              Expanded(
                flex: 12,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return const Card(
                      child: ListTile(
                        title: Text("Participación"),
                        subtitle: Text("Otorgado por Axel"),
                        trailing: Text("27/12/2022"),
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
}
