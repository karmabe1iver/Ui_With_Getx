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
      height: Get.mediaQuery.size.height * .16,
      width: Get.mediaQuery.size.width * .38,
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
                    left: Get.width * .21,
                    bottom: 0,
                    child: Image.asset(
                      AssetHelperImag2,
                      scale: 1.2,
                    ))
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
