import 'package:flutter/material.dart';
import 'package:ui_with_getx/app/components/textstyle.dart';

Widget RichTex({
  text,
  inputtext,
}){
return RichText(
text: TextSpan(
text: '$text',
style: TEXTSTYLE(
color: Colors.grey,
fontweight: FontWeight.w400,
fontsize: 13.0),
children: [
TextSpan(
text: '$inputtext',
style: TEXTSTYLE(
fontweight: FontWeight.bold,
fontsize: 12.0,
color: Colors.black),
),
],
),
);
}