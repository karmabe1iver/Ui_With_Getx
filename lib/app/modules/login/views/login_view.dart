import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ui_with_getx/app/components/mbutton.dart';
import 'package:ui_with_getx/app/modules/forget_password/views/forget_password_view.dart';
import 'package:ui_with_getx/app/routes/app_pages.dart';
import 'package:ui_with_getx/app/utils/asset_helper.dart';

import '../../../components/mtextformfield.dart';
import '../../../components/textstyle.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MTextFormField(
                  Style: TEXTSTYL(16.0, FontWeight.w400, Colors.black),
                  AssetName: AssetHelper.EmailIcon,
                  HintText: 'Email'),
              MTextFormField(
                  Style: TEXTSTYL(16.0, FontWeight.w400, Colors.black),
                  AssetName: AssetHelper.password,
                  HintText: 'Password'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(crossAxisAlignment: WrapCrossAlignment.center, children: [
                  Obx(
                    () => Checkbox(
                      value: controller.selected.value == 1,
                      onChanged: (val) {
                        val ?? true
                            ? controller.selected.value = 1
                            : controller.selected.value = null;
                      },
                      checkColor: Color.fromRGBO(18, 132, 198, 1),
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
                      Get.toNamed(Routes.FORGET_PASSWORD);
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
                onPress: () {
                  Get.offNamed(Routes.DASHBOARD);
                },
                string: 'Login',
              ),
           ),
         
        ],
      ),
    );
  }
}

TextStyle TEXTSTYL(fontsize, fontweight, color) {
  return TextStyle(
    fontSize: fontsize,
    fontWeight: fontweight,
    fontFamily: 'Poppins',
    color: color,
  );
}
