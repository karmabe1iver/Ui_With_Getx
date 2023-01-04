import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

Widget MButton({
  onPress,
  string,
}) {
  return Padding(
    padding: const EdgeInsets.all(18.0),
    child: Container(
      width: Get.width * .6,
      height: Get.height*.07,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
      child: TextButton(
        onPressed: onPress,
        child: Text(
          '$string',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins',
            color: Colors.white,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.blue[800]),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0),
            ),
          ),
        ),
      ),
    ),
  );
}
