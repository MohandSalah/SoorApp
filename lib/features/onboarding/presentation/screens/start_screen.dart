import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:soor/core/utils/routes/routes_enum.dart';

import '../../../../gen/assets.gen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed(Routes.onBoarding.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Assets.images.soor.path,
          ),
          const SizedBox(height: 32),
          Align(
            alignment: Alignment.bottomCenter,
            child: SpinKitThreeBounce(
              color: theme.colorScheme.onPrimary,
              size: 40.0,
            ),
          ),
        ],
      ),
    );
  }
}
