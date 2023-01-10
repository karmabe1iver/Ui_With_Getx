import 'package:flutter/material.dart';

Widget CustomContainer({child}){
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
    ),
    child: child,
  );
}