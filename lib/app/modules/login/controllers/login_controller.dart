import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final Rxn<int> selected = Rxn<int>();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  late TextEditingController emailController, passwordController;
  var email = '';
  var password = '';

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide valid Email";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 6) {
      return "Password must be of 6 characters";
    }
    return null;
  }

  void checkLogin() {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      Get.snackbar('Incorrect Details', 'Please Enter Correct Details',
          colorText:Colors.white ,
          snackPosition: SnackPosition.TOP,
          isDismissible: true,
          dismissDirection: DismissDirection.horizontal,
          icon: Icon(Icons.warning_amber_rounded,color: Colors.red,),
          backgroundColor: Color.fromRGBO(18, 132, 198, 1));
    } else {
      Get.offNamed(Routes.DASHBOARD,);
    }
    loginFormKey.currentState!.save();
  }
}

final count = 0.obs;
// void submitCommand() {
//   final form = formkey.;
//   if (form.validate()) {
//
//   }
// }
//   @override
//   void onInit() {
//     super.onInit();
//   }
//
//   @override
//   void onReady() {
//     super.onReady();
//   }
//
//   @override
//   void onClose() {
//     super.onClose();
//   }
//
//   void increment() => count.value++;
// }
