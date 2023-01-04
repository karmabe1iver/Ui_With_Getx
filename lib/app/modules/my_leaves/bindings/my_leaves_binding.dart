import 'package:get/get.dart';

import '../controllers/my_leaves_controller.dart';

class MyLeavesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyLeavesController>(
      () => MyLeavesController(),
    );
  }
}
