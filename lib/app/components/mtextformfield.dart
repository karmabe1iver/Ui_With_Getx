import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

Widget MTextFormField(
    {TextFormField
    //   AssetName,
    // Style,
    //   validator,
    // TextEditingController,
    // HintText
    }) {
  return Padding(
    padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 18.0),
    child: Container(
        height: Get.height * .058,
        decoration: BoxDecoration(
          border: Border.all(color: Color.fromRGBO(196, 199, 201, 1)),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: TextFormField
            // style: Style,
            // validator: validator,
            // controller: TextEditingController,
            // decoration: InputDecoration(
            //   icon: Image.asset(AssetName),
            //   border: InputBorder.none,
            //   hintText: HintText,


          ),
        ),

  );
}
