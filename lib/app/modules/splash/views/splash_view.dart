import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/asset_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool animate = false;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive,);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,));
    super.initState();
    startanimation();
   // Timer(const Duration(seconds: 5), () => Get.offNamed(Routes.LOGIN));
  }
  @override
  void dispose() {
   SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top,SystemUiOverlay.bottom]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          // direction: Axis.vertical,
          // alignment: WrapAlignment.center,
          // crossAxisAlignment: WrapCrossAlignment.center,
          // runSpacing: 12.0,
          children: [
            AnimatedPositioned(
              duration: Duration(milliseconds: 1200),
                right:animate? 50:-30,
                top:260,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 1900),
                    opacity: animate?1:0,
                    child: Image.asset(AssetHelper.logoImag))),
            AnimatedPositioned(
              duration: Duration(milliseconds: 1200),
              left:animate?80: -30,
              bottom: 280,
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 1900),
                opacity: animate?1:0,
                child: Image.asset(
                  AssetHelper.images('splash.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future startanimation() async {
    await Future.delayed(Duration(milliseconds: 800));
    setState(()=> animate= true);
    await Future.delayed(Duration(milliseconds: 2800));
    Get.offNamed(Routes.LOGIN);

  }
}