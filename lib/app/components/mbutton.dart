import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_with_getx/app/modules/login/controllers/login_controller.dart';



  class MButton extends StatelessWidget {
    final onPress ;
    final string;
    final child;

    MButton({Key? key,required this.onPress, this.string,this.child}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      Get.lazyPut(() => LoginController());
    //  Contoller= Get.put(LoginController());


      return Padding(
        padding: const EdgeInsets.all(18.0),
        child: Container(
          width: Get.width * .55,
          height: Get.height * .07,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            // gradient:  LinearGradient(colors: [
            //   Color.fromRGBO(76, 178, 229, 1),
            //   Color.fromRGBO(44, 157, 215, 1)

            //  ]
            // ),
            color: Color.fromRGBO(76, 178, 229, 1),
          ),
          child: TextButton(
            onPressed: onPress,
            child:
            Column(
mainAxisAlignment: MainAxisAlignment.center,
              children: [
              if(child==null)
                   Text(
                     '$string',
                     style: const TextStyle(
                       fontSize: 20,
                       fontWeight: FontWeight.w500,
                       fontFamily: 'Poppins',
                       color: Colors.white,
                     ),
                   )

                 else
                   child
                // Container(
                //   height: 45,
                //   width: 200,
                //   child: RiveAnimation.asset('asset/arrow.riv',
                //     fit: BoxFit.cover,
                //
                //
                //   ),
                // ),
              ],
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
  }
