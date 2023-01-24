import 'dart:io';

import 'package:Lakshore/app/data/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/customcontainer.dart';
import '../../../data/leavemodel.dart';

class LeaveRequestController extends GetxController {
  RxBool isButtonpressed = false.obs;

  Future ButtonPressed() async {
    isButtonpressed.value = true;
    await Future.delayed(Duration(milliseconds: 500));
    isButtonpressed.value = false;
  }

  final TextEditingController Reson = TextEditingController(text: '');
  List<LeaveModel> Leavefield = <LeaveModel>[].obs;

  RxString dropdownText = 'Leave Type '.obs as RxString;
  List<String> df = [
    'Leave Type ',
    'Casual Leave ',
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
