import 'package:Lakshore/app/components/image_common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../../../components/textstyle.dart';
import '../controllers/notice_board_controller.dart';

class NoticeBoardView extends GetView<NoticeBoardController> {
  const NoticeBoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(),
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
              color: Colors.blue,
            ),
          ),
        ),
        Positioned(
          top: 44,
          left: 40,
          right: 40,
          child: Center(
            child: Text(
              'Notice Borard',
              style: TEXTSTYLE(
                fontweight: FontWeight.w500,
                fontsize: 24.0,
                color: Colors.blue,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 75.0),
          child: Container(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, Index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 24, right: 24, bottom: 18),
                    child: Container(
                        width: Get.width * .85,
                        // height: Get.height * .23,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset.zero,
                                color: Colors.grey.shade300,
                                blurStyle: BlurStyle.outer,
                                blurRadius: 2,
                              )
                            ]),
                        // child: Card(
                        //   elevation: 2,
                        //   shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.circular(20.0),
                        //   ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 18.0, top: 18.0, right: 18.0),
                          child: Wrap(
                            runSpacing: 10,
                            children: [
                              Text(
                                'Id nobis quia quis',
                                style: TEXTSTYLE(
                                  fontweight: FontWeight.w500,
                                  fontsize: 20.0,
                                  color: const Color.fromRGBO(18, 132, 198, 1),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Posted On  :',
                                    style: TEXTSTYLE(
                                      fontweight: FontWeight.w500,
                                      color:
                                          const Color.fromRGBO(18, 132, 198, 1),
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
                              Padding(
                                padding: const EdgeInsets.only(bottom: 18.0),
                                child: ReadMoreText(
                                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum,Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum.',
                                  // maxLines: 2,
                                  trimLines: 3,
                                  trimMode: TrimMode.Line,
                                  //  overflow: TextOverflow.ellipsis,
                                  textDirection: TextDirection.ltr,
                                  textAlign: TextAlign.justify,
                                  style: TEXTSTYLE(
                                    fontweight: FontWeight.w500,
                                    color: Colors.black,
                                    fontsize: 12.0,
                                  ),
                                  trimCollapsedText:
                                      '\n  \n                                              Read More',
                                  moreStyle: TEXTSTYLE(
                                    fontweight: FontWeight.w500,
                                    color:
                                        const Color.fromRGBO(18, 132, 198, 1),
                                    fontsize: 15.0,
                                  ),
                                  trimExpandedText:
                                      ' \n                                                 Read Less',
                                  lessStyle: TEXTSTYLE(
                                    fontweight: FontWeight.w500,
                                    color:
                                        const Color.fromRGBO(18, 132, 198, 1),
                                    fontsize: 15.0,
                                  ),
                                ),
                              ),

                              // Row(
                              //   children: [
                              //     const Spacer(),
                              //     Text(
                              //       'Read More',
                              //       style: TEXTSTYLE(
                              //         fontweight: FontWeight.w500,
                              //         color: const Color.fromRGBO(18, 132, 198, 1),
                              //         fontsize: 15.0,
                              //       ),
                              //     ),
                              //   ],
                              // )
                            ],
                          ),
                        )),
                  );
                }),
          ),
        ),
      ],
    ));
  }
}
