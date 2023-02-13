import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:vibration/vibration.dart';

import '../../../components/leavecard.dart';
import '../../../components/leavefield.dart';
import '../../../components/textstyle.dart';
import '../../../data/leavemodel.dart';
import '../../../data/profile.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/asset_helper.dart';
import '../controllers/my_leaves_controller.dart';

class MyLeavesView extends GetView<MyLeavesController> {
  const MyLeavesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Stack(
              alignment: Alignment.topLeft,
              children: [
                Container(
                  //  height: Get.height * .29,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(50),
                        bottomLeft: Radius.circular(50)),

                    //  color: Colors.blue
                    gradient: LinearGradient(colors: [
                      Color.fromRGBO(76, 178, 229, 1),
                      Color.fromRGBO(44, 157, 215, 1)
                    ]),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 180,
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
                            top: 90,
                            left: 29,
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
                                          : Image.asset(
                                              AssetHelper.profileIMAGE)),
                                  // Image.asset(
                                  //   AssetHelper.profileIMAGE,
                                  // ),
                                  // maxRadius: 30,
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
                                        fontsize: 20.0,
                                        fontweight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      'Emp Id  :  xxxx xxxxx',
                                      style: TEXTSTYLE(
                                          fontweight: FontWeight.w500,
                                          fontsize: 14.0,
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: 28,

                        ),
                        child: Expanded(
                          child: Row(
                            // spacing: 40,
                            // direction: Axis.horizontal,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              LeaveField(
                                  NumberOfLeave: 30,
                                  LeaveCatogery: 'Total Leave'),
                              LeaveField(
                                  NumberOfLeave: 12, LeaveCatogery: 'Sick Leave'),
                              LeaveField(
                                  NumberOfLeave: 18,
                                  LeaveCatogery: 'Casual Leave'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
                      'My Leaves',
                      style: TEXTSTYLE(
                        fontweight: FontWeight.w500,
                        fontsize: Get.mediaQuery.size.height * .032,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (OverscrollIndicatorNotification overscroll) {
                    overscroll.disallowIndicator();
                    return true;
                  },
                  child: RefreshIndicator(
                    onRefresh: () async {
                      //controller.onInit();
                      controller.httpCall();
                    },
                    child: Obx(
                      () => ListView.builder(
                        // physics: ClampingScrollPhysics(),
                        itemCount: controller.LeaveFieldd.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              bottom: 24.0,
                            ),
                            child: SingleChildScrollView(
                              // physics: BouncingScrollPhysics(),
                              child: Slidable(
                                direction: Axis.horizontal,
                                endActionPane:
                                    controller.LeaveFieldd[index].sts == true
                                        ? ActionPane(
                                            extentRatio: .25,
                                            motion: ScrollMotion(),
                                            children: [
                                              SlidableAction(
                                                onPressed: (context) {
                                                  Leavefieldd.removeAt(index);
                                                  controller.LeaveFieldd
                                                      .removeAt(index);
                                                },
                                                backgroundColor: Colors.indigo,
                                                foregroundColor: Colors.white,
                                                icon: Icons.delete,
                                                label: 'Delete',
                                              )
                                            ],
                                          )
                                        : ActionPane(
                                            extentRatio: .001,
                                            motion: ScrollMotion(),
                                            children: []),
                                startActionPane:
                                    controller.LeaveFieldd[index].sts == true
                                        ? ActionPane(
                                            extentRatio: .25,
                                            motion: ScrollMotion(),
                                            children: [
                                              SlidableAction(
                                                onPressed: (context) async {
                                                  await Share.share(
                                                      ' Leave Request \n\n Leave Type :${controller.LeaveFieldd[index].Category} \n Leave From :${controller.LeaveFieldd[index].LeaveFrom} - ${controller.LeaveFieldd[index].LeaveTo}\n Reson :${controller.LeaveFieldd[index].ResonDes}');
                                                },
                                                backgroundColor: Colors.indigo,
                                                foregroundColor: Colors.white,
                                                icon: Icons.share,
                                                label: 'Share',
                                              )
                                            ],
                                          )
                                        : ActionPane(
                                            extentRatio: .001,
                                            motion: ScrollMotion(),
                                            children: []),
                                child: Wrap(
                                  runSpacing: 40,
                                  children: [
                                    LeaveCard(
                                      sts: controller.LeaveFieldd[index].sts,
                                      //Leavefield[index].sts,
                                      Reason:
                                          controller.LeaveFieldd[index].Reason,
                                      Catogery: controller
                                          .LeaveFieldd[index].Category,
                                      Status:
                                          controller.LeaveFieldd[index].Status,
                                      StatusBgColor:
                                          Color.fromRGBO(253, 231, 200, 1),
                                      StatusImg: AssetHelper.pending,
                                      StatusTextColor:
                                          Color.fromRGBO(255, 149, 3, 1),
                                      LeaveFrom: controller
                                          .LeaveFieldd[index].LeaveFrom,
                                      LeaveTo:
                                          controller.LeaveFieldd[index].LeaveTo,
                                      ReasonDes: controller
                                          .LeaveFieldd[index].ResonDes,
                                      Edit: AssetHelper.edit,
                                      OnTapE: () {
                                        Get.offAndToNamed(
                                          Routes
                                              .LEAVE_REQUEST, //arguments: controller.Leavefield[index]
                                        );
                                      },
                                      onTap: () {
                                        Vibration.vibrate(duration: 10);
                                        Leavefieldd.removeAt(index);
                                        controller.LeaveFieldd.removeAt(index);
                                      },
                                      Delete: AssetHelper.delete,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // LeaveCard(
            //     Reason: 'Suffering From Cold',
            //     Catogery: 'Sick Leave',
            //     Status: 'Approved',
            //     StatusTextColor: Color.fromRGBO(53, 164, 67, 1),
            //     StatusImg: AssetHelper.approved,
            //     StatusBgColor: Color.fromRGBO(210, 246, 214, 1),
            //     LeaveTo: 'Nov 8,2022',
            //     LeaveFrom: 'Nov 7, 2022',
            //
            // ),
            // LeaveCard(
            //     Reason: 'Trip',
            //     Catogery: 'Casual Leave',
            //     Status: 'Cancelled',
            //     StatusTextColor: Color.fromRGBO(255, 46, 0, 1),
            //     StatusBgColor: Color.fromRGBO(249, 217, 210, 1),
            //     StatusImg: AssetHelper.cancel,
            //     LeaveFrom: 'Oct 5 ,2022',
            //     LeaveTo: 'Oct 15,2022'
            //
            // ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(right: 35.0, bottom: 55),
          child: FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: Color.fromRGBO(18, 132, 198, 1),
            onPressed: () {
              Get.offAndToNamed(Routes.LEAVE_REQUEST);
            },
          ),
        ));
  }
}
