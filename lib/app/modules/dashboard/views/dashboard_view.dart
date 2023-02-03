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
    return  WillPopScope(
      onWillPop: ()async{
        SystemNavigator.pop();
        return false;
        },
      child: Scaffold(
          body: SingleChildScrollView(
            child: Wrap(
                children: [
                  Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Container(
                        height: Get.height * .48,
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
                            height: Get.height * .11,
                          ),
                          InkWell(
                            radius: 65,
                            onDoubleTap: (){
                              showImageViewer(context, controller.status.value != false
                                  ? Image.file(
                                controller.image.value!,
                                //LocalStore.setData(user.profilepic,'photo'),
                                scale: 1,
                                fit: BoxFit.cover,
                               ).image:Image.asset(AssetHelper.profileIMAGE).image,

                                  swipeDismissible: false);
                            },
                            onTap: () {
                              print(controller.image.value);
                              Get.defaultDialog(
                                  title: 'Upload',
                                  backgroundColor: Color.fromRGBO(76, 178, 229, 1),
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
                                          icon: Icon(Icons.camera_alt_rounded)),
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
                                maxRadius: controller.animate.value ? 0 : 65,
                                child: ClipOval(
                                    child: controller.status.value != false
                                        ? Image.file(
                                            controller.image.value!,
                                            //LocalStore.setData(user.profilepic,'photo'),
                                            width: controller.animate.value ? 0 : 130,
                                            height:
                                                controller.animate.value ? 0 : 130,
                                            scale: 1,
                                            fit: BoxFit.cover,
                                          )
                                        : Image.asset(AssetHelper.profileIMAGE)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Obx(
                              () => Wrap(runAlignment: WrapAlignment.center,

                                  //spacing: 5,
                                  children: [
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Text(
                                      'Amila',
                                      style: TEXTSTYLE(
                                        fontsize:
                                            controller.animate.value ? 0.0 : 30.0,
                                        fontweight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        Get.toNamed(Routes.PROFILEDETAILS);
                                      },
                                      icon: Icon(Icons.edit_calendar_outlined),
                                      color: Colors.white,
                                    ),
                                  ]),
                            ),
                          ),
                          SizedBox(
                            height: Get.height * .01,
                          ),
                          Obx(
                            () => Text(
                              'Registered Nurse',
                              style: TEXTSTYLE(
                                  fontweight: FontWeight.w500,
                                  fontsize: controller.animate.value ? 0.0 : 20.0,
                                  color: Colors.white),
                            ),
                          ),
                          Obx(
                            () => Text(
                              'Emp Id : xxxx xxxxx',
                              style: TEXTSTYLE(
                                  fontweight: FontWeight.w500,
                                  fontsize: controller.animate.value ? 0.0 : 17.0,
                                  color: Colors.white),
                            ),
                          )
                        ]),
                      ),
                      Image.asset(
                        AssetHelper.component,
                        scale: 1,
                      ),
                      Positioned(
                        left: 16,
                        top: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                SystemNavigator.pop();
                                //Get.back();
                              },
                              highlightColor: Colors.black,
                              splashColor: Colors.black,
                              splashRadius: 30,
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: Get.width * .16,
                            ),
                            Text(
                              'DashBoard',
                              style: TEXTSTYLE(
                                fontweight: FontWeight.w500,
                                fontsize: 24.0,
                                color: Colors.white,
                              ),
                            ),

                            // SizedBox(
                            //   width: Get.width * .13,
                            // )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Center(
                      child: Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        children: [
                          // child: GridView.count(crossAxisCount: 2,
                          //   scrollDirection: Axis.vertical,
                          //   l
                          Mcard(
                            onTap: () {
                              Get.toNamed(Routes.MY_LEAVES);
                            },
                            AssetHelperImag: AssetHelper.leave,
                            AssetHelperImag2: AssetHelper.userSm,
                            titile: 'My Leaves',
                          ),
                          Mcard(
                            onTap: () {
                              Get.toNamed(Routes.LEAVE_REQUEST);
                            },
                            AssetHelperImag: AssetHelper.leaverwquest,
                            scale: .8,
                            AssetHelperImag2: AssetHelper.userSm,
                            titile: 'Leave Request',
                          ),
                          Mcard(
                            onTap: () {
                              Get.toNamed(Routes.MY_SHIFT);
                            },
                            AssetHelperImag: AssetHelper.calender,
                            AssetHelperImag2: AssetHelper.userSm,
                            titile: 'My Shift',
                          ),
                          Mcard(
                            onTap: () {
                              Get.toNamed(Routes.NOTICE_BOARD);
                            },
                            AssetHelperImag: AssetHelper.noticeboard,
                            AssetHelperImag2: AssetHelper.userSm,
                            titile: 'Notice Board',
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

      ),
    );
  }
}
