import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:galileo_champions/core/app_colors.dart';
import 'package:galileo_champions/core/dimens.dart';

class ProfileRow extends StatelessWidget {
  final String title;
  final String content;

  const ProfileRow({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textTheme.headline5?.copyWith(color: AppColors.secondary),
        ),
        Text(
          content,
          style: textTheme.headline6,
        ),
        const SizedBox(height: AppDimens.separatorSize),
        const Divider(thickness: 1.0),
      ],
    );
  }
}
