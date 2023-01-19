import 'package:Lakshore/app/components/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

Widget dropDownBox({FunctioOnchanged, ListItem, ListValue}) {
  return
      //  Card(
      //  shape: RoundedRectangleBorder(
      //      borderRadius: BorderRadius.circular(10)),
      // // elevation: 1,
      // child:
      Container(
    height: Get.height * .06,
    width: 350,
    decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [
      BoxShadow(
        color: Colors.grey.shade300,
        offset: Offset.zero,

        blurRadius: 10,
        blurStyle: BlurStyle.outer, //spreadRadius: 35
      )
    ]),
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    // decoration: BoxDecoration(
    //     color: Colors.white, borderRadius: BorderRadius.circular(10)),

    child: DropdownButtonHideUnderline(
      child: DropdownButton<String>(
          value: ListValue,
          //controller.dropdownText.value,
          icon: Icon(Icons.keyboard_arrow_down_outlined),
          hint: Text('Leave Type'),
          elevation: 10,
          style: TEXTSTYLE(
              fontsize: 16.0, fontweight: FontWeight.w400, color: Colors.black),
          onChanged:
              // This is called when the user selects an item.
              FunctioOnchanged,
          items: ListItem //controller.df
          //     .map<DropdownMenuItem<String>>((String value) {
          //   return DropdownMenuItem<String>(
          //     value: value,
          //     child: Text(value),
          //   );
          // }).toList(),
          ),
    ),
    // ),
  );
}
