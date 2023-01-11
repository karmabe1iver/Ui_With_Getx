import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ui_with_getx/app/components/mcard.dart';
import 'package:ui_with_getx/app/components/textstyle.dart';
import 'package:ui_with_getx/app/modules/forget_password/views/forget_password_view.dart';
import 'package:ui_with_getx/app/modules/leave_request/bindings/leave_request_binding.dart';
import 'package:ui_with_getx/app/modules/leave_request/views/leave_request_view.dart';
import 'package:ui_with_getx/app/modules/login/views/login_view.dart';
import 'package:ui_with_getx/app/modules/my_leaves/views/my_leaves_view.dart';
import 'package:ui_with_getx/app/modules/my_shift/views/my_shift_view.dart';
import 'package:ui_with_getx/app/modules/notice_board/views/notice_board_view.dart';
import 'package:ui_with_getx/app/routes/app_pages.dart';

import '../../../utils/asset_helper.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    gradient: LinearGradient(
                      colors: [Color.fromRGBO(76, 178, 229, 1),Color.fromRGBO(44, 157, 215, 1)]
                    ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset.zero,
                      blurRadius: 2,
                      blurStyle: BlurStyle.outer,
                    )
                  ]
                ),
                child: Column(children: [
                  SizedBox(
                    height: Get.height * .11,
                  ),
                  CircleAvatar(
                    maxRadius: 65,
                    child: Image.asset(AssetHelper.profileIMAGE),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      'Amila',
                      style: TEXTSTYLE(
                        fontsize: 30.0,
                        fontweight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: Get.height*.01,),
                  Text(
                    'Registered Nurse',
                    style: TEXTSTYLE(
                        fontweight: FontWeight.w500,
                        fontsize: 20.0,
                        color: Colors.white),
                  ),
                  Text(
                    'Emp Id : xxxx xxxxx',
                    style: TEXTSTYLE(
                        fontweight: FontWeight.w500,
                        fontsize: 17.0,
                        color: Colors.white),
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
                        Get.back();
                      },
                       highlightColor: Colors.black,
                   splashColor : Colors.black,
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
            padding: const EdgeInsets.only(  top:20),
            child:
            Center(
              child: Wrap(
                spacing: 20,
                runSpacing: 20,
                children: [
                  // child: GridView.count(crossAxisCount: 2,
                  //   scrollDirection: Axis.vertical,
                  //   l
                  Mcard(
                    onTap: () {
                      Get.to(MyLeavesView());
                    },
                    AssetHelperImag: AssetHelper.leave,
                    AssetHelperImag2: AssetHelper.userSm,
                    titile: 'My Leaves',
                  ),
                  Mcard(
                    onTap: () {
                      Get.toNamed(Routes.LEAVE_REQUEST);
                    },
                    AssetHelperImag: AssetHelper.leaverwquest,scale: .8,
                    AssetHelperImag2: AssetHelper.userSm,
                    titile: 'Leave Request',
                  ),
                  Mcard(
                    onTap: () {
                      Get.to(MyShiftView());
                    },
                    AssetHelperImag: AssetHelper.calender,
                    AssetHelperImag2: AssetHelper.userSm,
                    titile: 'My Shift',
                  ),
                  Mcard(
                    onTap: () {
                      Get.to(NoticeBoardView());
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
        ));
  }
}
