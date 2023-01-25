import 'package:get/get.dart';

import '../controllers/updationrequest_controller.dart';

class UpdationrequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdationrequestController>(
      () => UpdationrequestController(),
    );
  }
}
