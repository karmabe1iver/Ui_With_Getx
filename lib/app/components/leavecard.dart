import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ui_with_getx/app/components/textstyle.dart';
import 'package:ui_with_getx/app/utils/asset_helper.dart';
bool stat= true;
Widget LeaveCard({
  sts,
  Reason,Catogery,Status,StatusImg,StatusBgColor,StatusTextColor,LeaveFrom,LeaveTo,
  ReasonDes,Edit,Delete
}) {

  return Padding(
    padding: const EdgeInsets.only(left: 18.0, right: 18.0),
    child: Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
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
                    Text(
                      '$Reason',
                      style: TEXTSTYLE(
                        fontweight: FontWeight.w600,
                        color: Colors.black,
                        fontsize: 20.0,
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
                Container(
                  height: 20,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: StatusBgColor),
                  child: Wrap(
                    spacing: 5,
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Image.asset(StatusImg),
                      Text(
                        '$Status',
                        style: TEXTSTYLE(
                          color: StatusTextColor
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Row(
              children: [
                Image.asset(
                  AssetHelper.Calender,
                  scale: 1.4,
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
                              color: Colors.black))
                    ]))
              ],
            ),
         if(stat==sts)
           Row(
             children: [
               Expanded(
                 child: Text(
                   '$ReasonDes',
                   maxLines: 2,
                   overflow: TextOverflow.ellipsis,
                   textDirection: TextDirection.ltr,
                   textAlign: TextAlign.justify,
                   style: TEXTSTYLE(fontsize: 12.0,
                       fontweight: FontWeight.w200,
                       color: Colors.grey),
                 ),
               ),
               SizedBox(width: Get.width * .3,),
               GestureDetector(onTap: () {}, child: Image.asset(Edit)),
               SizedBox(width: 10,),
               GestureDetector(
                   onTap: () {}, child: Image.asset(Delete, scale: .8,)),
             ],

           )

          ],
        ),
      ),
    ),
  );
}
