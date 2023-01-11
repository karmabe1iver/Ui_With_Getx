import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ui_with_getx/app/routes/app_pages.dart';

import '../../../components/mbutton.dart';
import '../../../components/mtextformfield.dart';
import '../../../components/textstyle.dart';
import '../../../utils/asset_helper.dart';
import '../controllers/forget_password_controller.dart';

class ForgetPasswordView extends GetView<ForgetPasswordController> {
  const ForgetPasswordView({Key? key}) : super(key: key);
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
                'Reset Password',
                style: TextStyle(fontSize:20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                  color: Colors.black,)
              ),
            ],
          ),),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MTextFormField(
                      Style: TEXTSTYLE(fontsize: 14.0,fontweight: FontWeight.w400,color: Colors.black),
                      AssetName: AssetHelper.emailIcon,
                      HintText: 'Email'),
                  MTextFormField(
                      Style: TEXTSTYLE(fontsize:14.0, fontweight:FontWeight.w400, color:Colors.black),
                      AssetName: AssetHelper.password,
                      HintText: 'New Password'),
                  MTextFormField(
                      Style: TEXTSTYLE(fontsize:14.0, fontweight:FontWeight.w400, color:Colors.black),
                      AssetName: AssetHelper.password,
                      HintText: 'Confirm Password'),
                ],
              ),

          Center(
            child: MButton(
              onPress: () {
                Get.offNamed(Routes.DASHBOARD);
              },
              string: 'Submit',
            ),
          ),
      ]
      )
    );
  }
}
