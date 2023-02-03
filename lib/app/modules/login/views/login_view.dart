import 'package:Lakshore/app/utils/local_store.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../components/mbutton.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/asset_helper.dart';
import '../../../utils/err_m.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // FormX fx = Get.put(FormX());
    return Obx(
      () => AnimatedOpacity(
        duration: Duration(milliseconds: 600),
        opacity: controller.animate.value ? 1 : .8,
        child: Scaffold(
          body: Wrap(
            children: [
              Obx(
                () => AnimatedOpacity(
                  duration: Duration(milliseconds: 600),
                  opacity: controller.animate.value ? 1 : 0,
                  child: Image.asset(
                    AssetHelper.component,
                    scale: 1,
                  ),
                ),
              ),
              Center(
                  child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                direction: Axis.vertical,
                spacing: 20.0,
                children: [
                  Obx(
                    () => AnimatedOpacity(
                        duration: Duration(milliseconds: 1500),
                        opacity: controller.animate.value ? 1 : 0,
                        child: Image.asset(AssetHelper.splashImag)),
                  ),
                  Text(
                    'Login',
                    style: TEXTSTYL(20.0, FontWeight.bold, Colors.black),
                  ),
                ],
              )),
              Obx(
                () => AnimatedOpacity(
                  duration: Duration(milliseconds: 1800),
                  opacity: controller.animate.value ? 1 : 0,
                  child: Form(
                    key: controller.loginFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // MTextFormField(
                        //   TextFormField:
                        AnimatedPadding(
                          padding: EdgeInsets.only(
                              left: controller.animate.value ? 18.0 : 0,
                              right: 18,
                              top: 18),
                          duration: Duration(milliseconds: 1800),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: controller.emailController,
                            onSaved: (Value) {
                              controller.email = Value!;
                            },
                            //autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              return controller.validateEmail(value!);
                            },
                            style:
                                TEXTSTYL(16.0, FontWeight.w400, Colors.black),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                prefixIcon: Image.asset(AssetHelper.emailIcon),
                                labelText: 'Email',
                                contentPadding: EdgeInsets.all(9),
                                hintText: 'Email'),
                          ),
                        ),

                        // ),
                        //  MTextFormField(
                        //    TextFormField:
                        AnimatedPadding(
                          padding: EdgeInsets.only(
                              left: controller.animate.value ? 18.0 : 0,
                              right: 18,
                              top: 18),
                          duration: Duration(milliseconds: 1800),
                          child: Obx(
                            () => TextFormField(
                              obscureText: controller.obscureText.value,
                              keyboardType: TextInputType.visiblePassword,
                              onSaved: (value) {
                                controller.password = value!;
                              },
                              controller: controller.passwordController,
                              validator: (value) {
                                return controller.validatePassword(value!);
                              },

                              // controller: controller.userCtrl,

                              //               validator: (val) => val.length < 4
                              // ? 'Your password is too Password too short..'
                              //     : null,
                              style:
                                  TEXTSTYL(16.0, FontWeight.w400, Colors.black),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                prefixIcon: Image.asset(AssetHelper.password),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    controller.obscureText.value =
                                        !controller.obscureText.value;
                                  },
                                  child: Icon(controller.obscureText.value
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                ),
                                contentPadding: EdgeInsets.all(9),
                                hintText: 'Password',
                                labelText: 'Password',
                              ),
                            ),
                          ),
                        ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 18.0,
                  right: 18.0,
                ),
                child: Obx(
                  () => AnimatedOpacity(
                    duration: Duration(milliseconds: 1800),
                    opacity: controller.animate.value ? 1 : 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Obx(
                                () => AnimatedOpacity(
                                  duration: Duration(milliseconds: 1800),
                                  opacity: controller.animate.value ? 1 : 0,
                                  child: Checkbox(
                                    overlayColor:
                                        MaterialStateProperty.all(Colors.blue),
                                    focusColor: Colors.blue,
                                    value: controller.selected.value == 1,
                                    onChanged: (val) {
                                      val ?? true
                                          ? controller.selected.value = 1
                                          : controller.selected.value = null;
                                      if (controller.selected.value == 1) {
                                        LocalStore.loginData('email',
                                            controller.emailController.text);
                                        LocalStore.loginData('password',
                                            controller.passwordController.text);

                                        // SharedPreferences.getInstance()
                                        //     .then((prefs) {
                                        //   prefs.setBool("remember_me",
                                        //       controller.selected.value == 1);
                                        //   prefs.setString('email',
                                        //       controller.emailController.text);
                                        //   prefs.setString(
                                        //       'password',
                                        //       controller
                                        //           .passwordController.text);
                                        // },
                                        // );
                                      }

                                      print(controller.selected.value);
                                    },
                                    hoverColor: Color.fromRGBO(18, 132, 198, 1),

                                    // Color.fromRGBO(18, 132, 198, 1),
                                    side: BorderSide(color: Colors.blue),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                ),
                              ),
                              Text(
                                'Remember me',
                                style: TEXTSTYL(14.0, FontWeight.w400,
                                    Color.fromRGBO(39, 42, 44, 1)),
                              ),
                            ]),
                        TextButton(
                            onPressed: () {
                              controller.startanimations();
                              //
                              //  Get.to(ForgetPasswordView(),transition: Transition.cupertino);
                            },
                            child: Text(
                              'ForgetPassword',
                              style: TEXTSTYL(14.0, FontWeight.w400,
                                  Color.fromRGBO(18, 132, 198, 1)),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: Obx(
                  () => AnimatedOpacity(
                    duration: Duration(milliseconds: 1800),
                    opacity: controller.animate.value ? 1 : 0,
                    child: Obx(
                      () => MButton(
                        onPress: () {
                          //controller.isButtonpressed.value=true;
                          controller.ButtonPressed();
                          Clipboard.setData(ClipboardData());
                          HapticFeedback.heavyImpact();

                          controller.isPlaying == true;
                          errM(() => controller.checkLogin());
                          // controller.checkLogin();

                          // controller.userCtrl.value==val;

                          //  Get.offNamed(Routes.DASHBOARD);
                        },
                        isButtonpressed: controller.isButtonpressed.value,
                        string: 'Login',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle TEXTSTYL(fontsize, fontweight, color) {
    return TextStyle(
      fontSize: fontsize,
      fontWeight: fontweight,
      fontFamily: 'Poppins',
      color: color,
    );
  }

  void sumbit() {
    (val) => !EmailValidator.validate(val!, true)
        ? Get.snackbar('Email', 'Please provide a valid email.',
            snackPosition: SnackPosition.TOP) //'Please provide a valid email.'
        : Get.offNamed(Routes.DASHBOARD);
  }
}
