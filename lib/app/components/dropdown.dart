import 'package:flutter/material.dart';
import 'package:ui_with_getx/app/components/textstyle.dart';

Widget dropDownBox({FunctioOnchanged,ListItem,ListValue }){
  return  Card(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)),
    elevation: 3,
    child: Container(
      height: 70,
      width: 380,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      // decoration: BoxDecoration(
      //     color: Colors.white, borderRadius: BorderRadius.circular(10)),

      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: ListValue, //controller.dropdownText.value,
          icon: Icon(Icons.keyboard_arrow_down_outlined),
          hint: Text('Leave Type'),
          elevation: 10,
          style: TEXTSTYLE(
              fontsize: 18.0,
              fontweight: FontWeight.w400,
              color: Colors.black),
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
    ),
  );


}
