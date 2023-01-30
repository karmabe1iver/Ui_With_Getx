import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class UpdationrequestController extends GetxController {
  RxString dropdownText = 'Marital Status'.obs as RxString;
  List<String> df = [
    'Marital Status',
    'Single',
    'Married',
  ].obs;
  RxBool animate= false.obs;
  Future startanimation() async {
    await Future.delayed(Duration(milliseconds: 1));
    animate.value= true;
    // await Future.delayed(Duration(milliseconds: 1800));
  }
  RxBool Upload=false.obs;
  Rx<File> files =File('') .obs;
  Future Filepick()async {
     FilePickerResult? result =await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path.toString());
       Upload.value=true;
    } else {
      Upload.value=false;
      // User canceled the picker
    };
  }
  final count = 0.obs;
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

  void increment() => count.value++;
}
