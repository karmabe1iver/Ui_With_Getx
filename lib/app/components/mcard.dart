import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

Widget Mcard({AssetHelperImag, AssetHelperImag2, titile, onTap, scale}) {
  return GestureDetector(
    onTap: onTap,

    // child: Card(
    //   elevation: 1,
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(20.0),
    //   ),
    child: Container(
      height: Get.height * .15,
      width: Get.width * .4,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: [
        BoxShadow(
          offset: Offset.zero,
          color: Colors.grey.shade300,
          blurStyle: BlurStyle.outer,
          blurRadius: 10,
        )
      ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (titile == 'My Shift')
            Stack(
              alignment: Alignment.center,
              children: [
                Container(),
                Image.asset(
                  AssetHelperImag,
                  scale: scale,
                ),
                Positioned(
                    left: 90, bottom: 0, child: Image.asset(AssetHelperImag2))
              ],
            )
          else
            Image.asset(
              AssetHelperImag,
              scale: scale,
            ),
          SizedBox(
            height: 10,
          ),
          Text(
            '$titile',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          )
        ],
      ),
    ),
    //),
  );
}
