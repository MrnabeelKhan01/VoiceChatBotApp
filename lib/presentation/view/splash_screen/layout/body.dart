import 'dart:async';
import 'package:flutter/material.dart';

import '../../../../configurations/frontend_configs.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({Key? key}) : super(key: key);

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  @override
  void initState() {
    // Timer(
    //     const Duration(seconds: 3),
    //     () => Navigator.pushReplacement(context,
    //         MaterialPageRoute(builder: (context) =>  const OnBoardingView())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          Image.asset(
            FrontendConfigs.kAppLogo,
            height:200,
            width:200,
          ),
        ],
      ),
    );
  }
}
