import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  RxBool isButtonpressed = false.obs;

  Future ButtonPressed() async {
    isButtonpressed.value = true;
    await Future.delayed(Duration(milliseconds: 500));
    isButtonpressed.value = false;
  }

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
