import 'package:Lakshore/app/components/mbutton.dart';
import 'package:Lakshore/app/data/payslip_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../components/dropdown.dart';
import '../../../components/image_common.dart';
import '../../../components/textstyle.dart';
import '../controllers/payslip_controller.dart';

class PayslipView extends GetView<PayslipController> {
  const PayslipView({Key? key}) : super(key: key);

  num get index => PaySlip.length;



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
          Positioned(
            top: 200,
            left: 10,
            right: 10,
            child: Obx(
              () => Padding(
                padding: const EdgeInsets.all(8.0),
                child: dropDownBox(
                    color: Colors.grey,
                    shadow: [BoxShadow(color: Colors.white)],
                    FunctioOnchanged: (String? value) {
                      Clipboard.setData(ClipboardData());
                      HapticFeedback.heavyImpact();
                      // This is called when the user selects an item.
                      controller.dropdownText.value = value!;
                      print(controller.dropdownText.value);
                    },
                    ListItem:
                    controller.df
                   .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    ListValue: controller.dropdownText.value),
              ),
            ),
          ),
          Positioned(
            top: 260,
            left: 40,
            right: 40,
            child: Center(
                child: Column(children: [
              MButton(
                onPress: () async {
                  for (int i=0; i<=index ;i++) {
                    if(controller.dropdownText.value==controller.df[i]) {
                      controller.launchInBrowser(controller.toLaunch[i]);
                    }
                  }
                  print(controller.CurrentMonth.value);
                  controller.SelectMonth.value = controller.dropdownText.value;
                },
                isButtonpressed: false,
                string: 'Submit',
              ),
              SizedBox(
                height: 24,
              ),
              Obx(() => controller.SelectMonth.value == ''
                  ? Text('')
                  : controller.SelectMonth.value == 'Select  Month'
                      ? Text(
                          'Please Select Month',
                          style: TEXTSTYLE(
                            fontweight: FontWeight.w600,
                            fontsize: 12.0,
                          ),
                        )
                      : Text(
                          'PaySlip of ${controller.SelectMonth.value}',
                          style: TEXTSTYLE(
                            fontweight: FontWeight.w600,
                            fontsize: 12.0,
                          ),
                        )),
            ])),
          )
        ],
      ),
    );
  }
}
