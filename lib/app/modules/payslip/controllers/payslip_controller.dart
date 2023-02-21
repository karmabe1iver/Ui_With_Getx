import 'package:get/get.dart';

class PayslipController extends GetxController {
  RxString SelectMonth= ''.obs;
  RxString dropdownText = 'Select  Month'.obs as RxString;
  List<String> df = [
    'Select  Month',
    'January  2023',
    'February  2023',
    'March  2023',
    'April  2023',
    'May  2023',
    'June 2023',
    'July  2023',
    'August 2023',
    'September 2023',
    'October 2023',
    'November 2023',
    'December 2023',
  ].obs;

  final count = 0.obs;

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

  void increment() => count.value++;
}
