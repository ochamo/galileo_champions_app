import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:galileo_champions/core/dimens.dart';

class CustomDialog extends StatelessWidget {
  final String message;
  final VoidCallback callback;
  const CustomDialog({
    super.key,
    required this.message,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Dialog(
      child: SizedBox(
        height: 300,
        child: Padding(
          padding: const EdgeInsets.all(AppDimens.defaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  message,
                  style: textTheme.headline6,
                ),
              ),
              Flexible(
                child: ElevatedButton(
                  onPressed: () {
                    callback();
                  },
                  child: const Text("Ok"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
