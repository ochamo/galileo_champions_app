import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:galileo_champions/core/navigation/routes.dart';

class MyPointsScreen extends StatefulWidget {
  const MyPointsScreen({super.key});

  @override
  State<StatefulWidget> createState() => _MyPointsScreenState();
}

class _MyPointsScreenState extends State<MyPointsScreen> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mis Champion Points"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(
                  "CC$index",
                  style: textTheme.headline6,
                ),
                subtitle: Text(
                  "Puntos acumulados: 14 points",
                  style: textTheme.bodyLarge,
                ),
                onTap: () {
                  AutoRouter.of(context).pushNamed(Routes.detailPoints);
                },
              ),
            );
          },
          itemCount: 6,
        ),
      ),
    );
  }
}
