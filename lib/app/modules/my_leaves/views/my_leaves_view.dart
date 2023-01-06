import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ui_with_getx/app/components/leavecard.dart';
import 'package:ui_with_getx/app/components/leavefield.dart';
import 'package:ui_with_getx/app/routes/app_pages.dart';

import '../../../components/textstyle.dart';
import '../../../utils/asset_helper.dart';
import '../controllers/my_leaves_controller.dart';

class MyLeavesView extends GetView<MyLeavesController> {
  const MyLeavesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Wrap(
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
                  height: 10,
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
                    'My Leaves',
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
                    maxRadius: 30,
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
                          fontsize: 17.0,
                          fontweight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Emp Id  :  xxxx xxxxx',
                        style: TEXTSTYLE(
                            fontweight: FontWeight.w500,
                            fontsize: 12.0,
                            color: Colors.white),
                      )
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              left: 20,
                bottom: 20,
                child: Wrap(
                 spacing: 40,
                  //crossAxisAlignment:WrapCrossAlignment.center,

                  children: [
                    LeaveField(
                      NumberOfLeave: 30,
                      LeaveCatogery: 'Total Leave'
                    ),
                    LeaveField(
                        NumberOfLeave: 12,
                        LeaveCatogery: 'Sick Leave'
                    ),
                    LeaveField(
                        NumberOfLeave: 18,
                        LeaveCatogery: 'Casual Leave'
                    ),
                  ],
                )
            )
          ],
        ),
         Padding(
           padding: const EdgeInsets.only(top: 20.0),
           child: Wrap(
             runSpacing: 20,
             children: [
               LeaveCard(
                 sts: true,
                 Reason: 'Going on Trip',
                 Catogery: 'Casual Leave',
                 Status: 'Pending',
                 StatusBgColor: Color.fromRGBO(253, 231, 200, 1),
                 StatusImg: AssetHelper.pending,
                 StatusTextColor: Color.fromRGBO(255, 149, 3, 1),
                 LeaveFrom: 'Jan 5, 2023',
                 LeaveTo: 'Jan 25, 2023',
                 ReasonDes: '“i am  going for a trip to Goa.Kindly grant me leave for the same”',
                 Edit: AssetHelper.Edit,
                 Delete: AssetHelper.Delete,
               ),

        LeaveCard(
            Reason: 'Suffering From Cold',
            Catogery: 'Sick Leave',
            Status: 'Approved',
            StatusTextColor: Color.fromRGBO(53, 164, 67, 1),
            StatusImg: AssetHelper.approved,
            StatusBgColor: Color.fromRGBO(210, 246, 214, 1),
            LeaveTo: 'Nov 8,2022',
            LeaveFrom: 'Nov 7, 2022',

        ),
        LeaveCard(
            Reason: 'Trip',
            Catogery: 'Casual Leave',
            Status: 'Cancelled',
            StatusTextColor: Color.fromRGBO(255, 46, 0, 1),
            StatusBgColor: Color.fromRGBO(249, 217, 210, 1),
            StatusImg: AssetHelper.cancel,
            LeaveFrom: 'Oct 5 ,2022',
            LeaveTo: 'Oct 15,2022'

        ),
             ],
           ),
         ),


      ],
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    floatingActionButton: Padding(
      padding: const EdgeInsets.all(18.0),
      child: FloatingActionButton(
      child: Icon(Icons.add),

      backgroundColor: Colors.blue,
      onPressed: () {
        Get.toNamed(Routes.LEAVE_REQUEST);


      },
      ),
    ),
    );
  }
}
