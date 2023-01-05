import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../components/textstyle.dart';
import '../../../utils/asset_helper.dart';
import '../controllers/leave_request_controller.dart';

class LeaveRequestView extends GetView<LeaveRequestController> {
  const LeaveRequestView({Key? key}) : super(key: key);

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
        ],
      ),
    );
  }
}
