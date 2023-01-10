import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ui_with_getx/app/components/dropdown.dart';
import 'package:ui_with_getx/app/components/mbutton.dart';

import '../../../components/textstyle.dart';
import '../../../utils/asset_helper.dart';
import '../controllers/leave_request_controller.dart';

class LeaveRequestView extends GetView<LeaveRequestController> {
  const LeaveRequestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        //runSpacing: 12,
        children: [
          Stack(
            children: [
              Container(
                height: Get.height * .29,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(60),
                      bottomLeft: Radius.circular(60)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(offset: Offset.zero, blurRadius: 2)
                  ],
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(76, 178, 229, 1),
                    Color.fromRGBO(44, 157, 215, 1)
                  ]),
                  // color: Colors.blue
                ),
                child: Column(
                  children: [
                    // SizedBox(
                    //   height: Get.height * .19,
                    // )
                  ],
                ),
              ),
              Image.asset(
                AssetHelper.component,
                scale: 1,
              ),
              Positioned(
                left: 16,
                top: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: Get.width * .13,
                    ),
                    Text(
                      'Leave Request',
                      style: TEXTSTYLE(
                        fontweight: FontWeight.w500,
                        fontsize: 24.0,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: Get.width * .16,
                    )
                  ],
                ),
              ),
              Positioned(
                left: 40,
                top: 100,
                child: Row(
                  children: [
                    CircleAvatar(
                      child: Image.asset(
                        AssetHelper.profileIMAGE,
                      ),
                      maxRadius: 40,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Amila',
                          style: TEXTSTYLE(
                            fontsize: 24.0,
                            fontweight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Emp Id  :  xxxx xxxxx',
                          style: TEXTSTYLE(
                              fontweight: FontWeight.w500,
                              fontsize: 18.0,
                              color: Colors.white),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              reverse: false,
              child: Wrap(runSpacing: 25, children: [
                Obx(
                  () => Padding(
                    padding:
                        const EdgeInsets.only(left: 24.0, right: 24.0, top: 24),
                    child: dropDownBox(
                        FunctioOnchanged: (String? value) {
                          // This is called when the user selects an item.
                          controller.dropdownText.value = value!;
                          print(controller.dropdownText.value);
                        },
                        ListItem: controller.df
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        ListValue: controller.dropdownText.value),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 24.0,
                    right: 24.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          DateTime? pickDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: //DateTime(1950),
                                  DateTime.now(),
                              //- not to allow to choose before today.
                              lastDate: DateTime(2100));
                          String convertedDate =
                              DateFormat.yMMMd('en_US').format(pickDate!);

                          controller.StartDate.value = convertedDate.toString();
                        },
                        // child: Card(
                        //   shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(10)),
                        //   elevation: 1,
                        child: Container(
                          height: Get.height * .06,
                          width: Get.width * .40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset.zero,
                                  color: Colors.grey.shade300,
                                  blurStyle: BlurStyle.outer,
                                  blurRadius: 10,
                                )
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 18.0, top: 12),
                            child: Wrap(
                              spacing: 10,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Image.asset(
                                  AssetHelper.Calender,
                                  scale: 1.8,
                                ),
                                Obx(
                                  () => Text(
                                    // controller: ,
                                    style: TEXTSTYLE(
                                        fontweight: FontWeight.w400,
                                        fontsize: 16.0,
                                        color: Colors.black),

                                    '${controller.StartDate.value}',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      //  ),
                      GestureDetector(
                        onTap: () async {
                          DateTime? pickDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: //DateTime(1950),
                                  DateTime.now(),
                              //- not to allow to choose before today.
                              lastDate: DateTime(2100));
                          // print(pickDate);
                          String convertedDate =
                              DateFormat.yMMMd('en_US').format(pickDate!);

                          controller.EndDate.value = convertedDate.toString();
                        },
                        // child: Card(
                        //   shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(10)),
                        //   elevation: 1,
                        child: Container(
                          height: Get.height * .06,
                          width: Get.width * .40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset.zero,
                                  color: Colors.grey.shade300,
                                  blurStyle: BlurStyle.outer,
                                  blurRadius: 10,
                                )
                              ]),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 18.0, top: 12.0),
                            child: Wrap(
                              spacing: 10,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Image.asset(
                                  AssetHelper.Calender,
                                  scale: 1.8,
                                ),
                                // if(pickDate)
                                Obx(
                                  () => Text(
                                    // controller: ,
                                    style: TEXTSTYLE(
                                        fontweight: FontWeight.w400,
                                        fontsize: 16.0,
                                        color: Colors.black),

                                    '${controller.EndDate.value}',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // ),
                      )
                    ],
                  ),
                ),
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                    child: FittedBox(
                      child: Container(
                        // elevation: 1,
                        // shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.circular(10)),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset.zero,
                                color: Colors.grey.shade300,
                                blurStyle: BlurStyle.outer,
                                blurRadius: 10,
                              )
                            ]),
                        child: ToggleButtons(
                          direction: Axis.horizontal,
                          onPressed: (int index) {
                            // The button that is tapped is set to true, and the others to false.
                            for (int i = 0;
                                i < controller.Selected.length;
                                i++) {
                              controller.Selected[i] = i == index;
                            }
                          },
                          borderRadius: BorderRadius.circular(10),
                          renderBorder: true,
                          // selectedBorderColor: Colors.blue,
                          selectedColor: Colors.white,
                          fillColor: Color.fromRGBO(18, 132, 198, 1),
                          color: Color.fromRGBO(18, 132, 198, 1),
                          textStyle: TEXTSTYLE(
                            fontweight: FontWeight.w400,
                            fontsize: 18.0,
                          ),
                          borderColor: Colors.transparent,
                          constraints: BoxConstraints.expand(
                              width: Get.width * .434,
                              height: Get.height * .067),
                          //number 2 is number of toggle buttons

                          isSelected: controller.Selected,
                          children: controller.HalforFull,
                        ),
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.only(
                      left: 24.0,
                      right: 24.0,
                    ),
                    child: dropDownBox(
                      ListValue: controller.departmentType.value,
                      ListItem: controller.department
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      FunctioOnchanged: (String? value) {
                        //            This is called when the user selects an item.
                        controller.departmentType.value = value!;
                      },
                    ),
                  ),
                ),
                //if(!isKeyBoard)
                // Padding(
                //   padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                // child: Card(
                //   elevation: 1,
                //   shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(20)),
                Padding(
                  padding: EdgeInsets.only(
                      left: 18.0,
                      bottom: MediaQuery.of(context).viewInsets.top),
                  child: Container(
                    height: Get.height * .16,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset.zero,
                            color: Colors.grey.shade300,
                            blurStyle: BlurStyle.outer,
                            blurRadius: 10,
                          )
                        ]),
                    //  child:
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: TextFormField(
                        //autofocus: true,

                        // initialValue: 'Reason',
                        style: TEXTSTYLE(
                          fontsize: 18.0,
                          fontweight: FontWeight.w500,
                        ),
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'Reason'),
                      ),
                    ),
                  ),
                ),

                //),
                if (WidgetsBinding.instance.window.viewInsets.bottom > 0.0)
                  SizedBox(
                    height: 10,
                    width: double.infinity,
                  )
                else
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MButton(onPress: () {}, string: 'Submit Request'),
                    ],
                  ),
              ]),
            ),
          ),
        ],
      ),
    );

    //      ]
    //)
    // );
  }
}
