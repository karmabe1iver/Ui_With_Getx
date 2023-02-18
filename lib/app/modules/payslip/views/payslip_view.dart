import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../components/image_common.dart';
import '../../../components/textstyle.dart';
import '../controllers/payslip_controller.dart';

class PayslipView extends GetView<PayslipController> {
  const PayslipView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
          children: [
          Container(),
      ImageCommon(),
      Positioned(
        left: 16,
        top: 36,
        child: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.blue,
          ),
        ),
      ),
      Positioned(
        top: 44,
        left: 40,
        right: 40,
        child: Center(
          child: Text(
            'PaySlip',
            style: TEXTSTYLE(
              fontweight: FontWeight.w500,
              fontsize: 24.0,
              color: Colors.blue,
            ),
          ),
        ),
      ),

      ]
      )
    );
  }
}
