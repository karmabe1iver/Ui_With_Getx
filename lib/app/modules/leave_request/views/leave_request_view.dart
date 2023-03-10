import 'package:Lakshore/app/components/image_common.dart';
import 'package:Lakshore/app/data/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:vibration/vibration.dart';

import '../../../../app.dart';
import '../../../components/dailogcontent.dart';
import '../../../components/dropdown.dart';
import '../../../components/mbutton.dart';
import '../../../components/textstyle.dart';
import '../../../data/leavemodel.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/asset_helper.dart';
import '../controllers/leave_request_controller.dart';

class LeaveRequestView extends GetView<LeaveRequestController> {
  const LeaveRequestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: WillPopScope(
        onWillPop: () async {
          Get.toNamed(Routes.DASHBOARD);
          return true;
        },
        child: Column(
          //runSpacing: 12,
          children: [
            Stack(
              children: [
                Container(
                  height: Get.height * .28,
                  width: double.infinity,
                  decoration: const BoxDecoration(
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
                  // child: Column(
                  //   children: [
                  //     // SizedBox(
                  //     //   height: Get.height * .19,
                  //     // )
                  //   ],
                  // ),
                ),
                ImageCommon(),
                // Image.asset(
                //   AssetHelper.component,
                //   scale: 1,
                // ),
                Positioned(
                  left: 16,
                  top: Get.mediaQuery.size.height * .036,
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: Get.mediaQuery.size.height * .030,
                    ),
                  ),
                ),
                Positioned(
                  left: 40,
                  right: 40,
                  top: Get.mediaQuery.size.height * .044,
                  child: Center(
                    child: Text(
                      'Leave Request',
                      style: TEXTSTYLE(
                        fontweight: FontWeight.w500,
                        fontsize: Get.mediaQuery.size.height * .032,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  left: 36,
                  top: Get.mediaQuery.size.height * .13,
                  child: Row(
                    children: [
                      CircleAvatar(
                        maxRadius: 38,
                        child: ClipOval(
                            child: ProfileList.length != 0
                                ? Image.file(
                                    ProfileList.last.profilePic,
                                    width: 120,
                                    height: 120,
                                    scale: 1,
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset(AssetHelper.profileIMAGE)),
                      ),
                      // Image.file(
                      //     ProfileList.last.profilePic,                            //AssetHelper.profileIMAGE,
                      //   ),
                      // ),
                      //
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            App.User.name.toString(),
                            //'Amila',
                            style: TEXTSTYLE(
                              fontsize: 24.0,
                              fontweight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Emp Id  : ${App.User.employeeId}',
                               // ' xxxx xxxxx',
                            style: TEXTSTYLE(
                                fontweight: FontWeight.w500,
                                fontsize: 14.0,
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
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (OverscrollIndicatorNotification overscroll) {
                  overscroll.disallowIndicator();
                  return true;
                },
                child: SingleChildScrollView(
                  reverse: false,
                  child: Wrap(
                    runSpacing: 25,
                    children: [
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.only(
                              left: 24.0, right: 24.0, top: 24),
                          child: dropDownBox(
                              FunctioOnchanged: (String? value) {
                                Clipboard.setData(ClipboardData());
                                HapticFeedback.heavyImpact();
                                // This is called when the user selects an item.
                                controller.dropdownText.value = value!;
                                print(controller.dropdownText.value);
                              },
                              ListItem: controller.df
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                Clipboard.setData(ClipboardData());
                                HapticFeedback.heavyImpact();
                                DateTime? pickDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: //DateTime(1950),
                                        DateTime.now(),
                                    //- not to allow to choose before today.
                                    lastDate: DateTime(2100));
                                String convertedDate =
                                    DateFormat.yMMMd('en_US').format(pickDate!);
                                controller.Start.value = pickDate;

                                controller.StartDate.value =
                                    convertedDate.toString();
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
                                child: Center(
                                  child: Wrap(
                                    spacing: 10,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    children: [
                                      Image.asset(
                                        AssetHelper.calender,
                                        scale: 1.9,
                                      ),
                                      Obx(
                                        () => Text(
                                          // controller: ,
                                          style: TEXTSTYLE(
                                              fontweight: FontWeight.w400,
                                              fontsize: 14.0,
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
                                Clipboard.setData(ClipboardData());
                                HapticFeedback.heavyImpact();
                                if (controller.StartDate.value != 'StartDate') {
                                  DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: controller.Start.value,
                                      firstDate: //DateTime(1950),
                                          controller.Start.value,
                                      //  DateTime.now(),
                                      //- not to allow to choose before today.

                                      lastDate: (controller.Start.value).add(
                                          Duration(days: 6)) // DateTime(2100)
                                      );
                                  // print(pickDate);
                                  String convertedDate =
                                      DateFormat.yMMMd('en_US')
                                          .format(pickedDate!);

                                  controller.EndDate.value =
                                      convertedDate.toString();

                                  // if(pickedDate.difference(controller.Start.value).inDays<0)

                                  print(controller.EndDate.value);
                                } else {
                                  Vibration.vibrate(
                                    duration: 100,
                                  );
                                  Get.defaultDialog(
                                      middleText: 'Please Select StartDate');
                                }
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
                                child: Center(
                                  child: Wrap(
                                    spacing: 10,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    children: [
                                      Image.asset(
                                        AssetHelper.calender,
                                        scale: 1.9,
                                      ),
                                      // if(pickDate)
                                      Obx(
                                        () => Text(
                                          // controller: ,
                                          style: TEXTSTYLE(
                                              fontweight: FontWeight.w400,
                                              fontsize: 14.0,
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
                          padding:
                              const EdgeInsets.only(left: 24.0, right: 24.0),
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
                              child: ToggleSwitch(
                                minWidth: Get.width * .70,
                                minHeight: Get.height * .058,
                                cornerRadius: 10.0,
                                activeBgColors: [
                                  [
                                    Color.fromRGBO(18, 132, 198, 1),
                                  ],
                                  [
                                    Color.fromRGBO(18, 132, 198, 1),
                                  ]
                                ],
                                activeFgColor: Colors.white,
                                inactiveBgColor: Colors.white,
                                inactiveFgColor:
                                    Color.fromRGBO(18, 132, 198, 1),
                                initialLabelIndex: controller.Intial.value,
                                fontSize: 14,
                                totalSwitches: 2,
                                labels: controller.Halforfull,
                                radiusStyle: true,
                                onToggle: (index) {
                                  Clipboard.setData(ClipboardData());
                                  HapticFeedback.heavyImpact();
                                  controller.Intial.value = index!;
                                  print('switched to: $index');
                                  print(controller.Selected.length);
                                  print(controller.Intial.value);
                                },
                              ),

                              // ToggleButtons(
                              //   direction: Axis.horizontal,
                              //   onPressed: (int index) {
                              //     // The button that is tapped is set to true, and the others to false.
                              //     for (int i = 0;
                              //         i < controller.Selected.length;
                              //         i++) {
                              //       controller.Selected[i] = i == index;
                              //     }
                              //   },
                              //   borderRadius: BorderRadius.circular(10),
                              //   renderBorder: false,
                              //   // selectedBorderColor: Colors.blue,
                              //   selectedColor: Colors.white,
                              //   fillColor: Color.fromRGBO(18, 132, 198, 1),
                              //   color: Color.fromRGBO(18, 132, 198, 1),
                              //   textStyle: TEXTSTYLE(
                              //     fontweight: FontWeight.w400,
                              //     fontsize: 18.0,
                              //   ),
                              //
                              //   borderColor: Colors.transparent,
                              //   constraints: BoxConstraints.expand(
                              //       width: Get.width * .434,
                              //       height: Get.height * .067),
                              //   //number 2 is number of toggle buttons
                              //
                              //   isSelected: controller.Selected,
                              //   children: controller.HalforFull,
                              // ),
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
                              Clipboard.setData(ClipboardData());
                              HapticFeedback.heavyImpact();
                              //            This is called when the user selects an item.
                              controller.departmentType.value = value!;
                              print(controller.departmentType.value);
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
                            left: 24.0,
                            right: 24.0,
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
                            padding: const EdgeInsets.only(left: 12.0),
                            child: TextFormField(
                              controller: controller.Reson,
                              //autofocus: true,
                              maxLines: 1000,

                              // initialValue: 'Reason',
                              style: TEXTSTYLE(
                                fontsize: 16.0,
                                fontweight: FontWeight.w500,
                              ),
                              decoration: InputDecoration(
                                  border: InputBorder.none, hintText: 'Reason'),
                            ),
                          ),
                        ),
                      ),

                      //),
                      if (WidgetsBinding.instance.window.viewInsets.bottom >
                          0.0)
                        SizedBox(
                          height: 10,
                          width: double.infinity,
                        )
                      else
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Obx(
                              () => MButton(
                                onPress: () {
                                  controller.ButtonPressed();
                                  if (controller.dropdownText.value !=
                                          'Leave Type ' &&
                                      controller.StartDate.value !=
                                          'StartDate' &&
                                      controller.EndDate.value != 'EndDate' &&
                                      controller.departmentType.value !=
                                          'Department Head' &&
                                      controller.Reson.text != '') {
                                    print(controller.dropdownText.value);
                                    print(controller.StartDate.value);
                                    print(controller.EndDate.value);
                                    print(controller.Intial.value);
                                    print(controller.departmentType.value);
                                    print(controller.Reson.text);

                                    //Leavefieldd.add(controller.Leavefield.first);
                                    Get.defaultDialog(
                                      title: 'Please Check Once More!!',
                                      contentPadding: EdgeInsets.only(
                                          top: 10,
                                          bottom: 20,
                                          left: 10,
                                          right: 10),
                                      content: Container(
                                        child: Wrap(
                                          direction: Axis.vertical,
                                          spacing: 5,
                                          runSpacing: 5,
                                          children: [
                                            RichTex(
                                                text: 'Leave Type :',
                                                inputtext:
                                                    ' ${controller.dropdownText.value}'),
                                            RichTex(
                                                text: 'Leave From :',
                                                inputtext:
                                                    ' ${controller.StartDate.value} - ${controller.EndDate.value}'),
                                            if (controller.Intial.value == 0)
                                              RichTex(
                                                  text: 'Full day or Half :',
                                                  inputtext: ' Full day')
                                            else
                                              RichTex(
                                                  text: 'Full day or Half :',
                                                  inputtext: ' Half Day'),
                                            RichTex(
                                                text: 'Department :',
                                                inputtext:
                                                    ' ${controller.departmentType.value}'),
                                            RichTex(
                                                text: 'Reson :',
                                                inputtext:
                                                    ' ${controller.Reson.value.text}')
                                          ],
                                        ),
                                      ),
                                      textCancel: 'Edit',
                                      onCancel: () {},
                                      radius: 30.0,
                                      textConfirm: 'Confirm & View Status',
                                      confirmTextColor: Colors.white,
                                      onConfirm: () {
                                        Leavefieldd.add(LeaveModel(
                                            sts: true,
                                            Status: 'Pending',
                                            Reason: controller.Reson.text,
                                            Category:
                                                controller.dropdownText.value,
                                            LeaveFrom:
                                                controller.StartDate.value,
                                            LeaveTo: controller.EndDate.value,
                                            ResonDes: controller.Reson.text));
                                        Get.offNamed(Routes.MY_LEAVES);
                                      },
                                    );
                                  } else {
                                    controller.ButtonPressed();
                                    Vibration.vibrate(
                                      duration: 100,
                                    );
                                    Get.snackbar(
                                      'Fill Details ',
                                      'Please  Fill Missing details ',
                                      snackPosition: SnackPosition.TOP,
                                      backgroundColor: Colors.white,
                                      colorText:
                                          Color.fromRGBO(44, 157, 215, 1),
                                      icon: Icon(
                                        Icons.alarm,
                                        color: Color.fromRGBO(7, 178, 229, 1),
                                      ),
                                      //       backgroundGradient:LinearGradient(
                                      //     colors: [
                                      //   Color.fromRGBO(7, 178, 229, 1),
                                      //   Color.fromRGBO(44, 157, 215, 1)
                                      // ]),
                                      isDismissible: true,
                                      dismissDirection:
                                          DismissDirection.horizontal,
                                    );
                                  }
                                },
                                string: 'Submit Request',
                                isButtonpressed:
                                    controller.isButtonpressed.value,
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    //      ]
    //)
    // );
  }
}

TextStyle TEXTStyle() {
  return TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    fontFamily: 'Poppins',
    color: Colors.black,
  );
}
