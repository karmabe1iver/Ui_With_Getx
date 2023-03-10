import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vibration/vibration.dart';

import '../../../components/mbutton.dart';
import '../../../components/textstyle.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/asset_helper.dart';
import '../../login/controllers/login_controller.dart';

class ForgetPasswordView extends GetView<LoginController> {
  const ForgetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Wrap(children: [
      Image.asset(
        AssetHelper.component,
        scale: 1,
      ),
      Center(
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          direction: Axis.vertical,
          spacing: 20.0,
          children: [
            Image.asset(AssetHelper.splashImag),
            Obx(
              () => AnimatedOpacity(
                duration: Duration(milliseconds: 1500),
                opacity: controller.animateclose.value ? 1 : 0,
                child: Text('Reset Password',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      color: Colors.black,
                    )),
              ),
            ),
          ],
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 18, top: 18),
            child: TextFormField(
              controller: controller.emailController,
              onSaved: (Value) {
                controller.email = Value!;
              },
              //autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                return controller.validateEmail(value!);
              },
              style: TEXTSTYLE(
                  fontsize: 16.0,
                  fontweight: FontWeight.w400,
                  color: Colors.black),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  prefixIcon: Image.asset(AssetHelper.emailIcon),
                  labelText: 'Email',
                  contentPadding: EdgeInsets.all(9),
                  hintText: 'Email'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 18, top: 18),
            child: TextFormField(
              obscureText: true,
              controller: controller.newpasswordcontroller,
              //              validator: (val) => val.length < 4
              // ? 'Your password is too Password too short..'
              //     : null,
              style: TEXTSTYLE(
                  fontsize: 16.0,
                  fontweight: FontWeight.w400,
                  color: Colors.black),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  prefixIcon: Image.asset(AssetHelper.password),
                  //icon:Image.asset( AssetHelper.password),
                  contentPadding: EdgeInsets.all(9),
                  labelText: 'New Password',
                  hintText: 'New Password'),
            ),
          ),
          Obx(
            () => AnimatedOpacity(
              duration: Duration(milliseconds: 400),
              opacity: controller.animateclose.value ? 1 : 0,
              child: AnimatedPadding(
                padding: EdgeInsets.only(
                    left: 18.0,
                    right: 18,
                    top: controller.animateclose.value ? 18 : 0),
                duration: Duration(milliseconds: 600),
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  controller: controller.confirmpasswordcontroller,
                  onSaved: (Value) {
                    controller.confirmpasswordcontroller.text = Value!;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) =>
                      controller.confirmpasswordcontroller.text ==
                              controller.newpasswordcontroller.text
                          ? null
                          : 'password is different',
                  style: TEXTSTYLE(
                      fontsize: 16.0,
                      fontweight: FontWeight.w400,
                      color: Colors.black),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      prefixIcon: Image.asset(AssetHelper.password),
                      // border: InputBorder.none,
                      // icon:Image.asset( AssetHelper.password),
                      contentPadding: EdgeInsets.all(9),
                      labelText: 'Confirm Password',
                      hintText: 'Confirm Password'),
                ),
              ),
            ),
          ),
        ],
      ),
      Center(
        child: Obx(
          () => MButton(
            onPress: () {
              controller.ButtonPressed();
              if (controller.newpasswordcontroller.text != '' &&
                  controller.confirmpasswordcontroller.text != '' &&
                  controller.confirmpasswordcontroller.text ==
                      controller.newpasswordcontroller.text) {
                Get.offNamed(Routes.DASHBOARD);
              } else {
                Vibration.vibrate(
                  duration: 500,
                );
                Get.snackbar(
                    'Incorrect Details', 'Please Enter Correct Details',
                    colorText: Colors.white,
                    snackPosition: SnackPosition.TOP,
                    isDismissible: true,
                    dismissDirection: DismissDirection.horizontal,
                    icon: Icon(
                      Icons.warning_amber_rounded,
                      color: Colors.red,
                    ),
                    backgroundColor: Color.fromRGBO(18, 132, 198, 1));
              }
            },
            string: 'Submit',
            isButtonpressed: controller.isButtonpressed.value,
          ),
        ),
      ),
    ]));
  }
}
