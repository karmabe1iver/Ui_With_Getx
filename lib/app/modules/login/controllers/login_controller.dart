import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vibration/vibration.dart';

import '../../../../app.dart';
import '../../../data/apires.dart';
import '../../../data/login_response.dart';
import '../../../data/service/login_service.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/err_m.dart';
import '../../../utils/local_store.dart';

class LoginController extends GetxController {
  RxBool obscureText = true.obs;

  RxBool isButtonpressed = false.obs;

  Future ButtonPressed() async {
    isButtonpressed.value = true;
    await Future.delayed(Duration(milliseconds: 400));
    isButtonpressed.value = false;
  }

  var isPlaying = false.obs;
  RxBool animate = false.obs;
  RxBool animateclose = false.obs;

  final Rxn<int> selected = Rxn<int>();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  late TextEditingController
      //emailController,
      //passwordController,
      newpasswordcontroller,
      confirmpasswordcontroller;
  final FocusNode userCtrlfocusNode = FocusNode();

  final FocusNode pswdCtrlfocusNode = FocusNode();
  final FocusNode newCtrlfocusNode = FocusNode();
  final FocusNode confirmCtrlfocusNode = FocusNode();
  var email = '';
  var password = '';
  RxBool isLoggingProgress = false.obs;

  Future startanimation() async {
    await Future.delayed(Duration(milliseconds: 500));
    animate.value = true;
    // await Future.delayed(Duration(milliseconds: 1800));
  }

  void doLogin() async {}

  Future startanimations() async {
    Get.toNamed(Routes.FORGET_PASSWORD);

    await Future.delayed(Duration(milliseconds: 10));
    animateclose.value = true;
    //await Future.delayed(Duration(milliseconds: 1800));
  }

  @override
  void onInit() {
    super.onInit();
    loadUserEmailPassword();
    startanimation();
    newpasswordcontroller = TextEditingController();
    confirmpasswordcontroller = TextEditingController();
    // emailController = TextEditingController();
    // passwordController = TextEditingController();
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

  void checkLogin() async {
    isLoggingProgress.value = true;
    final String emaill = emailController.text;
    final String pswdd = passwordController.text;
    Future.delayed(Duration(seconds: 5));
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      Vibration.vibrate(
        duration: 1000,
      );
      Get.snackbar('Incorrect Details', 'Please Enter Correct Details',
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
          isDismissible: true,
          dismissDirection: DismissDirection.horizontal,
          icon: Icon(
            Icons.warning_amber_rounded,
            color: Colors.red,
          ),
          backgroundColor: Color.fromRGBO(18, 132, 198, 1));
    } else {
      final ApiResp resp = await LoginServices.fetchUser(emaill, pswdd);
      if (resp.ok == false) {
        //MyUtils.msg(resp.msgs);
        isLoggingProgress.value = false;
        return;
      }

      User user = User.fromJson(resp.rdata);
      user.username = email;
      App.token = user.token ?? '';
      Get.offNamed(
        Routes.DASHBOARD,
      );
      LocalStore.setData('user_id', user.userid);
      LocalStore.setData('token', user.token);
      LocalStore.setData('user_firstname', user.firstname);
      LocalStore.setData('user_lastname', user.lastname);
      LocalStore.setData('user_email_verified', user.emailVerified);
      App.user = user;

      if (App.token.isEmpty && user.twoFactorRequired == false) {
        Vibration.vibrate(
          duration: 100,
        );
        Get.snackbar("Failed", "Login failed", backgroundColor: Colors.red);
        isLoggingProgress.value = false;
        return;
      }

      if (user.emailVerified == true) {
        Get.offAllNamed(Routes.DASHBOARD);
      } else {
        showMsg("Email not verified", "Failed");
        Vibration.vibrate(
          duration: 1000,
        );
      }

      loginFormKey.currentState!.save();
    }
  }

  void loadUserEmailPassword() async {
    var _email = LocalStore.getData("email") ?? "";
    var _password = LocalStore.getData("password") ?? "";
    print(_email);
    print(_password);

    // {
    //   SharedPreferences _prefs = await SharedPreferences.getInstance();
    //   var _email = _prefs.getString("email") ?? "";
    //   var _password = _prefs.getString("password") ?? "";
    //   var _remeberMe = _prefs.getBool("remember_me") ?? false;
    //   print(_remeberMe);
    //   print(_email);
    //   print(_password);
    //   if (_remeberMe) {
    //     selected == true;
    //   }
    emailController.text = _email ?? "";
    passwordController.text = _password ?? "";
    // }
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
