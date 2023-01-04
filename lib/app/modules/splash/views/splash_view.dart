import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ui_with_getx/app/utils/asset_helper.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);


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
          Image.asset(AssetHelper.logoImag,),
          Image.asset(AssetHelper.images('splash.png'),
          ),
        ],
      ),
    ));
  }
}
