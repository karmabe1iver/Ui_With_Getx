import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_with_getx/app/components/leavecard.dart';
import 'package:ui_with_getx/app/components/leavefield.dart';
import 'package:ui_with_getx/app/data/leavemodel.dart';
import 'package:ui_with_getx/app/routes/app_pages.dart';

import '../../../components/textstyle.dart';
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
            children: [
              Container(
                height: Get.height * .29,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(60),
                        bottomLeft: Radius.circular(60)),

                  //  color: Colors.blue
                  gradient: LinearGradient(
                      colors: [Color.fromRGBO(76, 178, 229, 1),Color.fromRGBO(44, 157, 215, 1)]
                  ),
                ),
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
                      width: Get.width * .16,
                    ),
                    Text(
                      'My Leaves',
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
                          NumberOfLeave: 30, LeaveCatogery: 'Total Leave'),
                      LeaveField(
                          NumberOfLeave: 12, LeaveCatogery: 'Sick Leave'),
                      LeaveField(
                          NumberOfLeave: 18, LeaveCatogery: 'Casual Leave'),
                    ],
                  ))
            ],
          ),
          Expanded(
            child: Container(
              child: ListView.builder(
                itemCount: Leavefield.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 24.0,),
                    child: SingleChildScrollView(
                      child: Wrap(
                        runSpacing: 40,
                        children: [
                          LeaveCard(
                            sts: Leavefield[index].sts,
                            Reason: Leavefield[index].Reason,
                            Catogery: Leavefield[index].Category,
                            Status: Leavefield[index].Status,
                            StatusBgColor: Color.fromRGBO(253, 231, 200, 1),
                            StatusImg: AssetHelper.pending,
                            StatusTextColor: Color.fromRGBO(255, 149, 3, 1),
                            LeaveFrom: Leavefield[index].LeaveFrom,
                            LeaveTo: Leavefield[index].LeaveTo,
                            ReasonDes: Leavefield[index].ResonDes,
                            Edit: AssetHelper.Edit,
                            Delete: AssetHelper.Delete,
                          ),
                        ],
                      ),
                    ),
                  );
                },
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
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(18.0),
        child: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Color.fromRGBO(18, 132, 198, 1),
          onPressed: () {
            Get.toNamed(Routes.LEAVE_REQUEST);
          },
        ),
      ),
    );
  }
}
