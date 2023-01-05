import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../components/textstyle.dart';
import '../../../utils/asset_helper.dart';
import '../controllers/notice_board_controller.dart';

class NoticeBoardView extends GetView<NoticeBoardController> {
  const NoticeBoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
          ),
          Image.asset(
            AssetHelper.component,
            scale: 1,
          ),
          Positioned(
            left: 30,
            top: 40,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Color.fromRGBO(18, 132, 198, 1),
                  ),
                ),
                SizedBox(
                  width: Get.width * .13,
                ),
                Text(
                  'Notice Board',
                  style: TEXTSTYLE(
                    fontweight: FontWeight.w500,
                    fontsize: 24.0,
                    color: Color.fromRGBO(18, 132, 198, 1),
                  ),
                ),
                SizedBox(
                  width: Get.width * .13,
                )
              ],
            ),
          ),
          Positioned(
            left: 30,
            top: 100,
            child: Container(
              width: Get.width * .85,
              height: Get.height * .23,
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 18.0, top: 18.0, right: 18.0),
                  child: Wrap(
                    runSpacing: 10,
                    children: [
                      Text(
                        'Id nobis quia quis',
                        style: TEXTSTYLE(
                          fontweight: FontWeight.w500,
                          fontsize: 20.0,
                          color: Color.fromRGBO(18, 132, 198, 1),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Posted On  :',
                            style: TEXTSTYLE(
                              fontweight: FontWeight.w500,
                              color: Color.fromRGBO(18, 132, 198, 1),
                              fontsize: 12.0,
                            ),
                          ),
                          Text(
                            ' Dec 21,2023',
                            style: TEXTSTYLE(
                              fontweight: FontWeight.w500,
                              color: Colors.black,
                              fontsize: 12.0,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.justify,
                        style: TEXTSTYLE(
                          fontweight: FontWeight.w500,
                          color: Colors.black,
                          fontsize: 12.0,
                        ),
                      ),
                      Row(
                        children: [
                          Spacer(),
                          Text(
                            'Read More',
                            style: TEXTSTYLE(
                              fontweight: FontWeight.w500,
                              color: Color.fromRGBO(18, 132, 198, 1),
                              fontsize: 15.0,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(left: 30, top: 320, child:  Container(
            width: Get.width * .85,
            height: Get.height * .23,
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding:
                const EdgeInsets.only(left: 18.0, top: 18.0, right: 18.0),
                child: Wrap(
                  runSpacing: 10,
                  children: [
                    Text(
                      'Id nobis quia quis',
                      style: TEXTSTYLE(
                        fontweight: FontWeight.w500,
                        fontsize: 20.0,
                        color: Color.fromRGBO(18, 132, 198, 1),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Posted On  :',
                          style: TEXTSTYLE(
                            fontweight: FontWeight.w500,
                            color: Color.fromRGBO(18, 132, 198, 1),
                            fontsize: 12.0,
                          ),
                        ),
                        Text(
                          ' Dec 21,2023',
                          style: TEXTSTYLE(
                            fontweight: FontWeight.w500,
                            color: Colors.black,
                            fontsize: 12.0,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.justify,
                      style: TEXTSTYLE(
                        fontweight: FontWeight.w500,
                        color: Colors.black,
                        fontsize: 12.0,
                      ),
                    ),
                    Row(
                      children: [
                        Spacer(),
                        Text(
                          'Read More',
                          style: TEXTSTYLE(
                            fontweight: FontWeight.w500,
                            color: Color.fromRGBO(18, 132, 198, 1),
                            fontsize: 15.0,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),),
          Positioned(left: 30, top: 540, child: Container(
            width: Get.width * .85,
            height: Get.height * .23,
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding:
                const EdgeInsets.only(left: 18.0, top: 18.0, right: 18.0),
                child: Wrap(
                  runSpacing: 10,
                  children: [
                    Text(
                      'Id nobis quia quis',
                      style: TEXTSTYLE(
                        fontweight: FontWeight.w500,
                        fontsize: 20.0,
                        color: Color.fromRGBO(18, 132, 198, 1),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Posted On  :',
                          style: TEXTSTYLE(
                            fontweight: FontWeight.w500,
                            color: Color.fromRGBO(18, 132, 198, 1),
                            fontsize: 12.0,
                          ),
                        ),
                        Text(
                          ' Dec 21,2023',
                          style: TEXTSTYLE(
                            fontweight: FontWeight.w500,
                            color: Colors.black,
                            fontsize: 12.0,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.justify,
                      style: TEXTSTYLE(
                        fontweight: FontWeight.w500,
                        color: Colors.black,
                        fontsize: 12.0,
                      ),
                    ),
                    Row(
                      children: [
                        Spacer(),
                        Text(
                          'Read More',
                          style: TEXTSTYLE(
                            fontweight: FontWeight.w500,
                            color: Color.fromRGBO(18, 132, 198, 1),
                            fontsize: 15.0,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),),
        ],
      ),
    );
  }
}
