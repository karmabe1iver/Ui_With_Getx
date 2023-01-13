import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget MButton({
  onPress,
  string,
}) {
  return Padding(
    padding: const EdgeInsets.all(18.0),
    child: Container(
      width: Get.width * .55,
      height: Get.height * .07,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        gradient: const LinearGradient(colors: [
          Color.fromRGBO(76, 178, 229, 1),
          Color.fromRGBO(44, 157, 215, 1)
        ]),
      ),
      child: TextButton(
        onPressed: onPress,
        child: Text(
          '$string',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins',
            color: Colors.white,
          ),
        ),
        style: ButtonStyle(
          backgroundColor:
              const MaterialStatePropertyAll(Color.fromRGBO(44, 157, 215, 1)),
          // surfaceTintColor: MaterialStatePropertyAll(Color.fromRGBO(76, 178, 229, 1)),
          foregroundColor:
              const MaterialStatePropertyAll(Color.fromRGBO(76, 178, 229, 1)),
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
