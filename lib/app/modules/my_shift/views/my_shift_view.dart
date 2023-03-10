import 'package:Lakshore/app/components/image_common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app.dart';
import '../../../components/textstyle.dart';
import '../../../data/profile.dart';
import '../../../utils/asset_helper.dart';
import '../controllers/my_shift_controller.dart';

class MyShiftView extends GetView<MyShiftController> {
  const MyShiftView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Wrap(
        children: [
          Stack(children: [
            Container(
              height: Get.height * .28,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50)),
                boxShadow: <BoxShadow>[
                  BoxShadow(offset: Offset.zero, blurRadius: 2)
                ],
                // color: Colors.blue
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(76, 178, 229, 1),
                  Color.fromRGBO(44, 157, 215, 1)
                ]),
              ),
            ),
            ImageCommon(),
            Positioned(
              left: 16,
              top: 36,
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              top: 44,
              left: 40,
              right: 40,
              child: Center(
                child: Text(
                  'My Shift',
                  style: TEXTSTYLE(
                    fontweight: FontWeight.w500,
                    fontsize: 24.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: Get.width * .13,
            ),
            Positioned(
              left: 40,
              top: 100,
              child: Row(
                children: [
                  CircleAvatar(
                    maxRadius: 38,
                    child: ClipOval(
                        child: ProfileList.length != 0
                            ? Image.file(
                                ProfileList.last.profilePic,
                                width: 130,
                                height: 130,
                                scale: 1,
                                fit: BoxFit.cover,
                              )
                            : Image.asset(AssetHelper.profileIMAGE)),
                    // Image.asset(
                    //   AssetHelper.profileIMAGE,
                    // ),
                    // maxRadius: 40,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        App.User.name.toString(),
                       // 'Amila',
                        style: TEXTSTYLE(
                          fontsize: 24.0,
                          fontweight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Emp Id  :  ${App.User.employeeId}',
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
          ]),
          Padding(
            padding: const EdgeInsets.only(left: 24.0, top: 24, right: 24),
            child: Container(
              width: double.infinity,
              // elevation: 3,
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(20.0),
              // ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset.zero,
                      color: Colors.grey.shade300,
                      blurStyle: BlurStyle.outer,
                      blurRadius: 10,
                    )
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Wrap(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  runSpacing: 10,
                  children: [
                    Text(
                      'Shift 1',
                      style: TEXTSTYLE(
                        fontweight: FontWeight.w500,
                        color: Color.fromRGBO(18, 132, 198, 1),
                        fontsize: 20.0,
                      ),
                    ),
                    FittedBox(
                      child: Row(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Start Date :',
                                style: TEXTSTYLE(
                                  fontweight: FontWeight.w500,
                                  color: Color.fromRGBO(18, 132, 198, 1),
                                  fontsize: 12.0,
                                ),
                              ),
                              Text(
                                'Dec 21, 2022',
                                style: TEXTSTYLE(
                                  fontweight: FontWeight.w500,
                                  color: Colors.black,
                                  fontsize: 12.0,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Row(
                            children: [
                              Text(
                                'End Date :',
                                style: TEXTSTYLE(
                                  fontweight: FontWeight.w500,
                                  color: Color.fromRGBO(18, 132, 198, 1),
                                  fontsize: 12.0,
                                ),
                              ),
                              Text(
                                'Dec 21, 2022',
                                style: TEXTSTYLE(
                                  fontweight: FontWeight.w500,
                                  color: Colors.black,
                                  fontsize: 12.0,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    FittedBox(
                      child: Row(children: [
                        Text(
                          'Time :',
                          style: TEXTSTYLE(
                            fontweight: FontWeight.w500,
                            color: Color.fromRGBO(18, 132, 196, 1),
                            fontsize: 12.0,
                          ),
                        ),
                        Text(
                          ' 9 am to 6 pm',
                          style: TEXTSTYLE(
                            fontweight: FontWeight.w500,
                            color: Colors.black,
                            fontsize: 12.0,
                          ),
                        )
                      ]),
                    ),
                    FittedBox(
                      child: Row(children: [
                        Text(
                          'Department  :',
                          style: TEXTSTYLE(
                            fontweight: FontWeight.w500,
                            color: Color.fromRGBO(18, 132, 198, 1),
                            fontsize: 12.0,
                          ),
                        ),
                        Text(
                          ' Emergency Medicine',
                          style: TEXTSTYLE(
                            fontweight: FontWeight.w500,
                            color: Colors.black,
                            fontsize: 12.0,
                          ),
                        )
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
