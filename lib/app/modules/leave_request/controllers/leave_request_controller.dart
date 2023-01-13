import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_with_getx/app/components/customcontainer.dart';

class LeaveRequestController extends GetxController {
  RxString dropdownText = 'Leave Type '.obs as RxString;
  List<String> df = [
    'Leave Type ',
    'Caual Leave ',
    'Sick Leave',
  ].obs;
  RxString EndDate = 'EndDate'.obs as RxString;
  RxString StartDate = 'StartDate'.obs as RxString;
  Rx<DateTime> Start = DateTime.now().obs;
  RxInt Intial = 0.obs as RxInt;

  List<Widget> HalforFull = <Widget>[
    CustomContainer(
      child: Text(
        'Full Day',
      ),
    ),
    CustomContainer(child: Text('Half Day'))
  ].obs;
  List<String> Halforfull = ['Full Day', 'Half Day'].obs;
  List<bool> Selected = <bool>[true, false].obs;
  RxString departmentType = 'Department Head'.obs as RxString;
  List<String> department = [
    'Department Head',
    'Emergency Medicine ',
    'Icu care ',
    'Ward ',
  ].obs;

//dropdown button in Ui

  @override
  void onInit() {
    super.onInit();
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
