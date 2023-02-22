import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MButton extends StatelessWidget {
  final onPress;

  final string;
  final child;
  bool isButtonpressed;

  MButton({
    Key? key,
    required this.onPress,
    this.string,
    this.child,
    required this.isButtonpressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Get.lazyPut(() => LoginController());
    //  Contoller= Get.put(LoginController());

    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        width: isButtonpressed ? Get.width * .52 : Get.width * .55,
        height: isButtonpressed ? Get.height * .068 : Get.height * .07,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            boxShadow: isButtonpressed
                ? []
                : [
                    BoxShadow(
                      color: Colors.grey.shade100,
                      offset: Offset(-2, -2),
                      blurRadius: 6,
                      spreadRadius: 1,
                      // blurStyle: BlurStyle.outer
                    ),
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(2, 2),
                      blurRadius: 3,
                      spreadRadius: 1,
                      //blurStyle: BlurStyle.outer
                      //
                    ),
                  ],
            // gradient:  LinearGradient(colors: [
            //   Color.fromRGBO(76, 178, 229, 1),
            //   Color.fromRGBO(44, 157, 215, 1)

            //  ]
            // ),
            color: Colors.white10),
        child: TextButton(
          onPressed: onPress,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$string',
                style: TextStyle(
                  fontSize: Get.mediaQuery.size.height * .024,
                  fontWeight:
                      isButtonpressed ? FontWeight.normal : FontWeight.w500,
                  fontFamily: 'Poppins',
                  color: isButtonpressed ? Colors.white70 : Colors.white,
                ),
              )
            ],
          ),
          style: ButtonStyle(
            backgroundColor:
                const MaterialStatePropertyAll(Color.fromRGBO(44, 157, 215, 1)),
            //const MaterialStatePropertyAll(Colors.blue),
            // surfaceTintColor: MaterialStatePropertyAll(Color.fromRGBO(76, 178, 229, 1)),
            foregroundColor:
                const MaterialStatePropertyAll(Color.fromRGBO(76, 178, 229, 1)),
            //const MaterialStatePropertyAll(Colors.blueGrey),
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
}
