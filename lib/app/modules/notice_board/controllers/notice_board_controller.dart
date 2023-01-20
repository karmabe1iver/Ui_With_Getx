import 'package:get/get.dart';

class NoticeBoardController extends GetxController {
  //TODO: Implement NoticeBoardController

  RxBool animate= false.obs;
  var isReadmore= false.obs;
  Future startanimation() async {
    await Future.delayed(Duration(milliseconds: 500));
    animate.value= true;
    // await Future.delayed(Duration(milliseconds: 1800));
  }
  @override
  void onInit() {
    super.onInit();
        startanimation();
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
