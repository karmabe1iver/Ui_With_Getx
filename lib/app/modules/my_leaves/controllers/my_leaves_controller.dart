import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

import '../../../data/leavemodel.dart';

class MyLeavesController extends GetxController  {
  //TODO: Implement MyLeavesController

  List<LeaveModel> LeaveFieldd = List<LeaveModel>.from(Leavefieldd).obs;
  late Uint8List imageFile;
  ScreenshotController screenshotController = ScreenshotController();


      // Rx<int> ListLength=Leavefield.lastIndexOf
  void httpCall() async {
    await Future.delayed(Duration(seconds: 5),
            () => LeaveFieldd
    );
    print('hi');
    update();
  }
  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
  new GlobalKey<RefreshIndicatorState>();
  // Future<Null> refresh(){
  //   return
  // }

  @override
  void onInit() {
    super.onInit();
    update();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => refreshIndicatorKey.currentState?.show());
  }

   @override
   void onReady() {
     super.onReady();
   }

  @override
  void onClose() {
    super.onClose();
  }


}
