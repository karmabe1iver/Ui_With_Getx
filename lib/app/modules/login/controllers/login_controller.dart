import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';




import '../../../routes/app_pages.dart';

class LoginController extends GetxController {

  var isPlaying = false.obs;

  final Rxn<int> selected = Rxn<int>();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  late TextEditingController emailController, passwordController;
  var email = '';
  var password = '';

  @override
  void onInit() {
    super.onInit();
    loadUserEmailPassword();
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
    Future.delayed(Duration(seconds: 5));
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      Get.snackbar('Incorrect Details', 'Please Enter Correct Details',
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
          isDismissible: true,
          dismissDirection: DismissDirection.horizontal,
          icon: Icon(Icons.warning_amber_rounded, color: Colors.red,),
          backgroundColor: Color.fromRGBO(18, 132, 198, 1));
    } else {
      Get.offNamed(Routes.DASHBOARD,);
    }
    loginFormKey.currentState!.save();
  }
  void loadUserEmailPassword() async {
     {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      var _email = _prefs.getString("email") ?? "";
      var _password = _prefs.getString("password") ?? "";
      var _remeberMe = _prefs.getBool("remember_me") ?? false;
      print(_remeberMe);
      print(_email);
      print(_password);
      if (_remeberMe) {

         selected== true ;
        }
        emailController.text = _email ?? "";
        passwordController.text = _password ?? "";
      }
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
