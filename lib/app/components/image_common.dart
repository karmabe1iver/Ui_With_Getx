import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../utils/asset_helper.dart';

class ImageCommon extends StatelessWidget {
  const ImageCommon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.mediaQuery.size.width * .46,
      height: Get.mediaQuery.size.height * .22,
      child: Image.asset(
        AssetHelper.component,
        scale: 1.5,

        fit: BoxFit.fill,
        // scale: 1,
      ),
    );
  }
}
