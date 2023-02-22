import 'dart:core';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/payslip_model.dart';

class PayslipController extends GetxController {
  List<Uri> toLaunch = [
    Uri(
        scheme: 'https',
        host: 'africau.edu',
        path: '/images/default/sample.pdf')
  ];

  //Uri(scheme: 'https', host: 'africau.edu', path: '/images/default/sample.pdf')

  static get index => PaySlip.length - 1;

  Future<void> launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  RxString CurrentMonth = DateTime.now().month.toString().obs;
  RxString SelectMonth = ''.obs;
  RxString dropdownText = 'Select  Month'.obs as RxString;
  List<String> df = ['Select  Month'];

  //PaySlip[index].Month.obs as List<String>;
  //     [
  //   'Select  Month',

  // ].obs as List<String>;

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    for (int i = 0; i <= index; i++) {
      df.add(PaySlip[i].Month);
    }
    for (int i = 0; i <= index; i++) {
      toLaunch.add(PaySlip[i].pay);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
