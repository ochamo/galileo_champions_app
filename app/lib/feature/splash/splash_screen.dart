import 'package:flutter/material.dart';
import 'package:galileo_champions/core/dimens.dart';
import 'package:galileo_champions/feature/splash/views/tutorial_page_1.dart';
import 'package:galileo_champions/feature/splash/views/tutorial_page_2.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PageController _controller = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(AppDimens.defaultPadding),
          child: PageView(
            controller: _controller,
            children: [
              TutorialPage1(
                nextPage: () {
                  _controller.animateToPage(
                    1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                },
              ),
              TutorialPage2(),
            ],
          ),
        ),
      ),
    );
  }
}
