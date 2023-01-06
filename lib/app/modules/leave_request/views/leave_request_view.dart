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
      body: Wrap(
        runSpacing: 12,
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
                    color: Colors.blue),
                child: Column(
                  children: [
                    SizedBox(
                      height: Get.height * .19,
                    )
                  ],
                ),
              ),
              Image.asset(
                AssetHelper.component,
                scale: 1,
              ),
              Positioned(
                left: 30,
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
                      width: Get.width * .13,
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
          Obx(
            () => Padding(
              padding:
                  const EdgeInsets.only(left: 18.0, right: 18.0, top: 10.0),
              // child: Card(
              //   shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(20)),
              //   elevation: 3,
              //   child: Container(
              //     height: 70,
              //     width: 380,
              //     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              //     // decoration: BoxDecoration(
              //     //     color: Colors.white, borderRadius: BorderRadius.circular(10)),
              //
              //     child: DropdownButtonHideUnderline(
              //       child: DropdownButton<String>(
              //         value: controller.dropdownText.value,
              //         icon: Icon(Icons.keyboard_arrow_down_outlined),
              //         hint: Text('Leave Type'),
              //         elevation: 10,
              //         style: TEXTSTYLE(
              //             fontsize: 18.0,
              //             fontweight: FontWeight.w400,
              //             color: Colors.black),
              //         onChanged: (String? value) {
              //           // This is called when the user selects an item.
              //           controller.dropdownText.value = value!;
              //         },
              //         items: controller.df
              //             .map<DropdownMenuItem<String>>((String value) {
              //           return DropdownMenuItem<String>(
              //             value: value,
              //             child: Text(value),
              //           );
              //         }).toList(),
              //       ),
              //     ),
              //   ),
              // ),
              child: dropDownBox(
                  FunctioOnchanged:  (String? value) {
                    // This is called when the user selects an item.
                    controller.dropdownText.value=value!;
                  },
                  ListItem: controller.df .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  ListValue:controller.dropdownText.value

                ),
              ),
            ),

          Padding(
            padding: const EdgeInsets.only(
              left: 18.0,
              right: 18.0,
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
                            DateTime
                                .now(), //- not to allow to choose before today.
                        lastDate: DateTime(2100));
                    String convertedDate =
                        DateFormat("yyyy-MM-dd").format(pickDate!);

                    controller.StartDate.value = convertedDate.toString();
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 4,
                    child: Container(
                      height: Get.height * .08,
                      width: Get.width * .42,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0, top: 18.0),
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
                                    fontsize: 18.0,
                                    color: Colors.black),

                                '${controller.StartDate.value}',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    DateTime? pickDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: //DateTime(1950),
                            DateTime
                                .now(), //- not to allow to choose before today.
                        lastDate: DateTime(2100));
                    // print(pickDate);
                    String convertedDate =
                        DateFormat("yyyy-MM-dd").format(pickDate!);

                    controller.EndDate.value = convertedDate.toString();
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 4,
                    child: Container(
                      height: Get.height * .08,
                      width: Get.width * .42,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0, top: 18.0),
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
                                    fontsize: 18.0,
                                    color: Colors.black),

                                '${controller.EndDate.value}',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Obx(
            () => Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

                child: ToggleButtons(
                  direction: Axis.horizontal,
                  onPressed: (int index) {
                    // The button that is tapped is set to true, and the others to false.
                    for (int i = 0; i < controller.Selected.length; i++) {
                      controller.Selected[i] = i == index;
                    }
                  },
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  selectedBorderColor: Colors.blue,
                  selectedColor: Colors.white,
                  fillColor: Colors.blue,
                  color: Colors.blue,
                  textStyle: TEXTSTYLE(
                    fontweight: FontWeight.w400,
                    fontsize: 18.0,
                  ),
                  borderColor: Colors.transparent,
                  constraints: BoxConstraints(
                    minHeight: Get.height * .07,
                    minWidth: Get.width * .45,
                  ),
                  isSelected: controller.Selected,
                  children: controller.HalforFull,
                ),
              ),
            ),
          ),
          Obx(
                () => Padding(
              padding:
              const EdgeInsets.only(left: 18.0, right: 18.0,),
              // child: Card(
              //   shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(20)),
              //   elevation: 3,
              //   child: Container(
              //     height: 70,
              //     width: 380,
              //     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              //     // decoration: BoxDecoration(
              //     //     color: Colors.white, borderRadius: BorderRadius.circular(10)),
              //
              //     child: DropdownButtonHideUnderline(
              //       child: DropdownButton<String>(
              //         value: controller.departmentType.value,
              //         icon: Icon(Icons.keyboard_arrow_down_outlined),
              //         hint: Text('Leave Type'),
              //         elevation: 10,
              //         style: TEXTSTYLE(
              //             fontsize: 18.0,
              //             fontweight: FontWeight.w400,
              //             color: Colors.black),
              //         onChanged: (String? value) {
              //           // This is called when the user selects an item.
              //           controller.departmentType.value = value!;
              //         },
              //         items: controller.department
              //             .map<DropdownMenuItem<String>>((String value) {
              //           return DropdownMenuItem<String>(
              //             value: value,
              //             child: Text(value),
              //           );
              //         }).toList(),
              //       ),
              //     ),
              //   ),
              // ),
                  child: dropDownBox(
                    ListValue: controller.departmentType.value,
                    ListItem:  controller.department
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
          Padding(
            padding: const EdgeInsets.only(left: 18.0,right: 18.0),
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Container(
                height: Get.height*.13,

                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: TextFormField(
                    // initialValue: 'Reason',
                    style: TEXTSTYLE(
                      fontsize: 18.0,
                      fontweight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Reason'
                    ),
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MButton(
                onPress: (){}
                    ,
                string: 'Submit Request'
              )
            ],
          )
        ],
      ),
    );
  }
}
