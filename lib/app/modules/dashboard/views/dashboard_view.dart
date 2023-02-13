import 'package:Lakshore/app/utils/local_store.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../components/mcard.dart';
import '../../../components/textstyle.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/asset_helper.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth < 600.0) {
              return Wrap(
                children: [
                  Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Container(
                        //height: Get.height * .46,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(60),
                                bottomLeft: Radius.circular(60)),
                            //color: Color.fromRGBO(18, 132, 198, 1),
                            gradient: LinearGradient(colors: [
                              Color.fromRGBO(76, 178, 229, 1),
                              Color.fromRGBO(44, 157, 215, 1)
                            ]),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset.zero,
                                blurRadius: 2,
                                blurStyle: BlurStyle.outer,
                              )
                            ]),
                        child: Column(children: [
                          SizedBox(
                            height: Get.mediaQuery.size.height * .11,
                          ),
                          Stack(
                            children: [
                              InkWell(
                                radius: 60,
                                onDoubleTap: () {
                                  showImageViewer(
                                      context,
                                      controller.status.value != false
                                          ? Image.file(
                                              controller.image.value!,
                                              //LocalStore.setData(user.profilepic,'photo'),
                                              scale: 1,
                                              fit: BoxFit.cover,
                                            ).image
                                          : Image.asset(
                                                  AssetHelper.profileIMAGE)
                                              .image,
                                      swipeDismissible: false);
                                },
                                onTap: () {
                                  print(controller.image.value);
                                  Get.defaultDialog(
                                      title: 'Upload',
                                      backgroundColor:
                                          Color.fromRGBO(76, 178, 229, 1),
                                      contentPadding: EdgeInsets.all(10),
                                      content: Wrap(
                                        runSpacing: 30,
                                        spacing: 50,
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                controller.getImageCam();
                                                Get.back();
                                              },
                                              icon: Icon(
                                                  Icons.camera_alt_rounded)),
                                          IconButton(
                                              onPressed: () {
                                                controller.getImage();
                                                Get.back();
                                              },
                                              icon: Icon(Icons.photo)),
                                        ],
                                      ));
                                  // controller.getImage();
                                  // print('hi');
                                },
                                child: Obx(
                                  () => CircleAvatar(
                                    maxRadius:
                                        controller.animate.value ? 0 : 60,
                                    child: ClipOval(
                                        child: controller.status.value !=
                                                false
                                            ? Image.file(
                                                controller.image.value!,
                                                //LocalStore.setData(user.profilepic,'photo'),
                                                width:
                                                    controller.animate.value
                                                        ? 0
                                                        : 120,
                                                height:
                                                    controller.animate.value
                                                        ? 0
                                                        : 120,
                                                scale: 1,
                                                fit: BoxFit.cover,
                                              )
                                            : Image.asset(
                                                AssetHelper.profileIMAGE)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Obx(
                              () => Wrap(
                                  alignment: WrapAlignment.center,
                                  crossAxisAlignment:
                                      WrapCrossAlignment.center,
                                  //runAlignment: WrapAlignment.center,

                                  //spacing: 5,
                                  children: [
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Text(
                                      'Amila',
                                      style: TEXTSTYLE(
                                        fontsize: controller.animate.value
                                            ? 20.0
                                            : Get.mediaQuery.size.height *
                                                .036,
                                        fontweight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        Get.toNamed(Routes.PROFILEDETAILS);
                                      },
                                      icon: Icon(
                                        Icons.edit_calendar_outlined,
                                        size: controller.animate.value
                                            ? 0.0
                                            : Get.mediaQuery.size.height *
                                                .030,
                                      ),
                                      color: Colors.white,
                                    ),
                                  ]),
                            ),
                          ),
                          // SizedBox(
                          //   height:Get.mediaQuery.size.height*.006,
                          // ),
                          Obx(
                            () => Text(
                              'Registered Nurse',
                              style: TEXTSTYLE(
                                  fontweight: FontWeight.w400,
                                  fontsize: controller.animate.value
                                      ? 0.0
                                      : Get.mediaQuery.size.height *
                                          .022, //20.0,
                                  color: Colors.white),
                            ),
                          ),
                          Obx(
                            () => Padding(
                              padding: const EdgeInsets.only(bottom: 28.0),
                              child: Text(
                                'Emp Id : xxxx xxxxx',
                                style: TEXTSTYLE(
                                    fontweight: FontWeight.w400,
                                    fontsize: controller.animate.value
                                        ? 16.0
                                        : Get.mediaQuery.size.height * .017,
                                    color: Colors.white),
                              ),
                            ),
                          )
                        ]),
                      ),
                      Container(
                        width: Get.mediaQuery.size.width * .46,
                        height: Get.mediaQuery.size.height * .22,
                        child: Image.asset(
                          AssetHelper.component,
                          scale: 1.5,

                          fit: BoxFit.fill,
                          // scale: 1,
                        ),
                      ),
                      Positioned(
                        right: 16,
                        top: Get.mediaQuery.size.height * .036,
                        child: IconButton(
                          onPressed: () {
                            LocalStore.clearData();
                            SystemNavigator.pop();
                            //Get.back();
                          },
                          highlightColor: Colors.black,
                          splashColor: Colors.black,
                          splashRadius: 20,
                          icon: Icon(
                            Icons.logout_rounded,
                            color: Colors.white,
                            size: Get.mediaQuery.size.height * .030,
                          ),
                        ),
                        // SizedBox(
                        //   width: Get.width * .16,
                        // ),
                        // Text(
                        //   'DashBoard',
                        //   style: TEXTSTYLE(
                        //     fontweight: FontWeight.w500,
                        //     fontsize: 24.0,
                        //     color: Colors.white,
                        //   ),
                      ),
                      Positioned(
                        left: 40,
                        right: 40,
                        top: Get.mediaQuery.size.height * .044,
                        child: Center(
                          child: Text(
                            'DashBoard',
                            style: TEXTSTYLE(
                              fontweight: FontWeight.w500,
                              fontsize: Get.mediaQuery.size.height * .032,
                              color: Colors.white,
                            ),
                          ),
                        ),

                        // SizedBox(
                        //   width: Get.width * .13,
                        // )
                      ),

                      // ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 28),
                    child: Center(
                      child: Wrap(
                        spacing: 24,
                        runSpacing: 24,
                        children: [
                          // child: GridView.count(crossAxisCount: 2,
                          //   scrollDirection: Axis.vertical,
                          //   l
                          Mcard(
                            onTap: () {
                             // controller.animate.value = true;
                               Get.toNamed(Routes.MY_LEAVES);
                            },
                            AssetHelperImag: AssetHelper.leave,
                            scale: 1.1,
                            AssetHelperImag2: AssetHelper.userSm,
                            titile: 'My Leaves',
                          ),
                          Mcard(
                            onTap: () {
                              Get.toNamed(Routes.LEAVE_REQUEST);
                            },
                            AssetHelperImag: AssetHelper.leaverwquest,
                            scale: .9,
                            AssetHelperImag2: AssetHelper.userSm,
                            titile: 'Leave Request',
                          ),
                          Mcard(
                            onTap: () {
                              Get.toNamed(Routes.MY_SHIFT);
                            },
                            AssetHelperImag: AssetHelper.calender,
                            scale: 1.2,
                            AssetHelperImag2: AssetHelper.userSm,
                            titile: 'My Shift',
                          ),
                          Mcard(
                            onTap: () {
                              Get.toNamed(Routes.NOTICE_BOARD);
                            },
                            AssetHelperImag: AssetHelper.noticeboard,
                            scale: 1.1,
                            AssetHelperImag2: AssetHelper.userSm,
                            titile: 'Notice Board',
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Container(child: Center(child: Text('hi screen Size is big')));
            }
          }),
        ),
      ),
    );
  }
}
