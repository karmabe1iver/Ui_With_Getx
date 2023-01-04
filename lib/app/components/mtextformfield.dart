


import 'package:flutter/material.dart';

Widget MTextFormField(
    {AssetName,
      Style,
      //TextEditingController,
      HintText}) {
  return Padding(
    padding: const EdgeInsets.only(left: 18.0,right: 18.0 ,top: 18.0),
    child: Container(
      // height: Get.height*.07,
        height: 60,

        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(30),
        ),
        child:

        Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: TextFormField(
            style: Style,
            //controller: TextEditingController,
            decoration: InputDecoration(
              icon: Image.asset(AssetName),
              border: InputBorder.none,
              hintText: HintText,
            ),
          ),
        )

    ),
  );
}
