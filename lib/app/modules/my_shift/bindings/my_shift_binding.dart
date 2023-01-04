import 'package:get/get.dart';

import '../controllers/my_shift_controller.dart';

class MyShiftBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyShiftController>(
      () => MyShiftController(),
    );
  }
}
