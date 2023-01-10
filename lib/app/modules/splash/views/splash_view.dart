import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:ui_with_getx/app/routes/app_pages.dart';
import 'package:ui_with_getx/app/utils/asset_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () => Get.offNamed(Routes.LOGIN));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(child:
      Wrap(
        direction: Axis.vertical,
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        runSpacing: 12.0,
        children: [
          SvgPicture.asset(AssetHelper.logoImag),
          Image.asset(AssetHelper.images('splash.png'),
          ),
        ],
       ) ,
      ),
    );
  }
}






