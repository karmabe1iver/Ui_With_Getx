import 'dart:async';

import 'package:flutter/animation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ui_with_getx/app/modules/login/views/login_view.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController  with GetSingleTickerProviderStateMixin{
  late AnimationController animationController;
  late Animation<double> animation;
  @override
  void onInit() {

    super.onInit();
    Timer(
        Duration(seconds: 3),
            () =>Get.offNamed(Routes.LOGIN)

    );
    Get.to( LoginView());
    checkAlreadyLogged();
    animationInitilization();
  }
  animationInitilization() {
    animationController =
        AnimationController(vsync: this , duration: const Duration(seconds: 2));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut)
            .obs
            .value;
    animation.addListener(() => update());
    animationController.forward();
  }
  Future<void> checkAlreadyLogged() async {
    Future.delayed(
        const Duration(milliseconds: 14),
    () async
    {
      if(Duration.microsecondsPerDay==14)
      Get.offNamed(Routes.LOGIN);
      Get.to( LoginView());
    }
    );
  }


}
