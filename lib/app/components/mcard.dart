import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ui_with_getx/app/utils/asset_helper.dart';

Widget Mcard({AssetHelperImag, titile, onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        height: Get.height * .15,
        width: Get.width * .4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AssetHelperImag),
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
    ),
  );
}
