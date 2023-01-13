import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_with_getx/app/components/mbutton.dart';
import 'package:ui_with_getx/app/modules/forget_password/views/forget_password_view.dart';
import 'package:ui_with_getx/app/routes/app_pages.dart';
import 'package:ui_with_getx/app/utils/asset_helper.dart';
import 'package:email_validator/email_validator.dart';

import '../../../components/mtextformfield.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // FormX fx = Get.put(FormX());
    return Scaffold(
      body: Wrap(
        children: [
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
                  Text(
                    'Login',
                    style: TEXTSTYL(20.0, FontWeight.bold, Colors.black),
                  ),
                ],
              )),
          Form(
            key: controller.loginFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // MTextFormField(
                //   TextFormField:
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0,right: 18,top: 18),

                      child: TextFormField(


                         controller: controller.emailController,
                        onSaved: (Value){
                           controller.email=Value!;
                        },
                        //autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
    return controller.validateEmail(value!);},
                        style: TEXTSTYL(16.0, FontWeight.w400, Colors.black),
                        decoration: InputDecoration(
                            border:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)
                            ),
                            prefixIcon: Image.asset(AssetHelper.emailIcon),
                            labelText: 'Email',
                            contentPadding: EdgeInsets.all(9),
                            hintText: 'Email'),
                      ),
                    ),

               // ),
               //  MTextFormField(
               //    TextFormField:
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0,right: 18,top: 18),
                    child: TextFormField(
                      obscureText: true,
                     keyboardType: TextInputType.visiblePassword,
                     onSaved: (value) {
    controller.password = value!;},
                      controller: controller.passwordController,
                      validator: (value) {
                        return controller.validatePassword(value!);
                      },


                     // controller: controller.userCtrl,

                      //               validator: (val) => val.length < 4
                      // ? 'Your password is too Password too short..'
                      //     : null,
                      style: TEXTSTYL(16.0, FontWeight.w400, Colors.black),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                          ),
                          prefixIcon: Image.asset(AssetHelper.password),
                          contentPadding: EdgeInsets.all(9),
                          hintText: 'Password',
                          labelText: 'Password'),
                    ),
                  ),
               // ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 18.0,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(crossAxisAlignment: WrapCrossAlignment.center, children: [
                  Obx(
                        () =>
                        Checkbox(
                          value: controller.selected.value == 1,
                          onChanged: (val) {
                            val ?? true
                                ? controller.selected.value = 1
                                : controller.selected.value = null;
                          },
                          hoverColor: Color.fromRGBO(18, 132, 198, 1),

                          // Color.fromRGBO(18, 132, 198, 1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                        ),
                  ),
                  Text(
                    'Remember me',
                    style: TEXTSTYL(
                        14.0, FontWeight.w400, Color.fromRGBO(39, 42, 44, 1)),
                  ),
                ]),
                TextButton(
                    onPressed: () {
                      Get.toNamed(Routes.FORGET_PASSWORD,);
                    //  Get.to(ForgetPasswordView(),transition: Transition.cupertino);
                    },

                    child: Text(
                      'ForgetPassword',
                      style: TEXTSTYL(14.0, FontWeight.w400,
                          Color.fromRGBO(18, 132, 198, 1)),
                    ))
              ],
            ),
          ),
          Center(
            child: MButton(
              onPress:
                  () {
                controller.checkLogin();
                        // controller.userCtrl.value==val;



                //  Get.offNamed(Routes.DASHBOARD);


              },
              string: 'Login',
            ),
          ),
        ],
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
        ? Get.snackbar('Email', 'Please provide a valid email.',snackPosition: SnackPosition.TOP) //'Please provide a valid email.'
        : Get.offNamed(Routes.DASHBOARD);


  }
}
