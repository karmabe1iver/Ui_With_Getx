import 'package:Lakshore/app/components/textstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsCard extends StatelessWidget {
  final heading;
  late Widget wrap;
  DetailsCard( {Key? key,required this.heading,required this.wrap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.only(left: 18.0,right: 18.0,top: 18.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  offset: Offset.zero,
                  color: Colors.grey.shade300,
                  blurStyle: BlurStyle.outer,
                  blurRadius: 5,
                ),
              ]),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //direction: Axis.vertical,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                        heading,
                      style: TEXTSTYLE(
                        fontsize: 18.0,
                        fontweight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
                Divider(
                  thickness: 2.0,
                  color: Colors.grey.shade300,
                ),
               wrap
              ],
            ),
          ),
        ));
  }
}
  Widget content({field,deatail}){

  return  RichText(
      text: TextSpan(
          text: '$field :  ',
          style: _textStyle(),
          children: [
            TextSpan(
              text: "$deatail",
              style: _style(),
            )
          ]));
  }

TextStyle _textStyle() {
  return TEXTSTYLE(
      fontweight: FontWeight.w700, fontsize: 14.0, color: Colors.black);
}

TextStyle _style() {
  return TEXTSTYLE(
      fontweight: FontWeight.w100, fontsize: 14.0, color: Colors.black);
}
