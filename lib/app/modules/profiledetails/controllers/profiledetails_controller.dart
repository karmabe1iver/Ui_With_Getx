import 'package:get/get.dart';

class ProfiledetailsController extends GetxController {
  //TODO: Implement ProfiledetailsController
  RxBool animate = false.obs;

  Future startanimation() async {
    await Future.delayed(Duration(milliseconds: 1));
    animate.value = true;

    await Future.delayed(Duration(milliseconds: 800));
    animate.value= false;
  }


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

  }


}
