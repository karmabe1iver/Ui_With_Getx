import 'package:Lakshore/app/components/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../utils/asset_helper.dart';

Widget LeaveField({NumberOfLeave, LeaveCatogery}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Image.asset(AssetHelper.leaveBox),
      SizedBox(
        width: 10,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            '$NumberOfLeave',
            style: TEXTSTYLE(
              fontsize: 30.0,
              fontweight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            '$LeaveCatogery',
            style: TEXTSTYLE(
              fontsize: 10.0,
              fontweight: FontWeight.w400,
              color: Colors.white,
            ),
          )
        ],
      )
    ],
  );
}
