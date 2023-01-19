import 'dart:async';

import 'package:flutter/material.dart';import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/asset_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () => Get.offNamed(Routes.LOGIN));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Wrap(
          direction: Axis.vertical,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          runSpacing: 12.0,
          children: [
            Image.asset(AssetHelper.logoImag),
            Image.asset(
              AssetHelper.images('splash.png'),
            ),
          ],
        ),
      ),
    );
  }
}
