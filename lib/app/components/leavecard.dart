import 'package:Lakshore/app/components/textstyle.dart';
import 'package:Lakshore/app/utils/asset_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';


bool stat = true;

Widget LeaveCard(
    {sts,
    Reason,
    Catogery,
    Status,
    StatusImg,
    StatusBgColor,
    StatusTextColor,
    LeaveFrom,
    LeaveTo,
    ReasonDes,
    Edit,
    OnTapE,
    onTap,
    Delete}) {
  return Padding(
    padding: const EdgeInsets.only(left: 18.0, right: 18.0),
    child: Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [
        BoxShadow(
          offset: Offset.zero,
          color: Colors.grey.shade300,
          blurStyle: BlurStyle.outer,
          blurRadius: 10,
        )
      ]),
      //elevation: 2,
      // shape: RoundedRectangleBorder(
      // borderRadius: BorderRadius.circular(10.0),
      //  ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 18.0,
          bottom: 18.0,
          left: 18.0,
          right: 18.0,
        ),
        child: Wrap(
          runSpacing: 10,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: Get.width * .55,
                        child: Text(
                          '$Reason',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins',
                            color: Colors.black,
                          ),
                          // TEXTSTYLE(
                          //   fontweight: FontWeight.w600,
                          //   color: Colors.black,
                          //   fontsize: 20.0,
                        ),
                      ),
                      Text(
                        '$Catogery',
                        style: TEXTSTYLE(
                          fontweight: FontWeight.w200,
                          color: Colors.grey,
                          fontsize: 10.0,
                        ),
                      )
                    ],
                  ),
                
                if (Status == 'Pending')
                  Container(
                    // height: 20,
                    // width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromRGBO(253, 231, 200, 1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 4.0,right: 4.0),
                      child: Wrap(
                        spacing: 5,
                        direction: Axis.horizontal,
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Image.asset(
                            AssetHelper.pending,
                          ),
                          Text(
                            '$Status',
                            style: TEXTSTYLE(
                              color: Color.fromRGBO(255, 149, 3, 1),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                else if (Status == 'Approved')
                  Container(
                    // height: 20,
                     //width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromRGBO(210, 246, 214, 1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 4.0,right: 4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        // spacing: 5,
                        // direction: Axis.horizontal,
                        // alignment: WrapAlignment.center,
                        // crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Image.asset(
                            AssetHelper.approved,
                          ),
                          Text(
                            '$Status',
                            style: TEXTSTYLE(
                              color: Color.fromRGBO(53, 164, 67, 1),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
              ],
            ),
            Row(
              children: [
                Image.asset(
                  AssetHelper.calender,
                  scale: 1.9,
                ),
                SizedBox(
                  width: 10,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Leave From  : ',
                    style: TEXTSTYLE(
                        color: Colors.grey,
                        fontweight: FontWeight.w400,
                        fontsize: 13.0),
                    children: [
                      TextSpan(
                        text: '$LeaveFrom - $LeaveTo',
                        style: TEXTSTYLE(
                            fontweight: FontWeight.bold,
                            fontsize: 12.0,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (stat == sts)

              Row(
                  children: [
                   Expanded(child:  Text(
                      '$ReasonDes',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.justify,
                      style: TEXTSTYLE(
                          fontsize: 12.0,
                          fontweight: FontWeight.w200,
                          color: Colors.grey),
                    ),
  ),
                    SizedBox(
                      width: Get.width * .25,
                    ),
                    GestureDetector(
                        onTap: OnTapE,
                        //     () {
                        //   Get.toNamed(Routes.LEAVE_REQUEST);
                        // },
                        child: Image.asset(Edit)),
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: onTap,
                      //     () {
                      //   Leavefield.remove(Index)
                      // },
                      child: Image.asset(
                        Delete,
                        scale: .8,
                      ),
                    ),

                  ],
                ),

          ],
        ),
      ),
    ),
  );
}
