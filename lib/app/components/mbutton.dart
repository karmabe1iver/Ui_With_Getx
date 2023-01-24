import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../modules/login/controllers/login_controller.dart';




  class MButton extends StatelessWidget {
    final onPress ;
    final string;
    final child;
    bool isButtonpressed;

    MButton({Key? key,required this.onPress, this.string,this.child,required this.isButtonpressed, }) : super(key: key);

    @override
    Widget build(BuildContext context) {
      //Get.lazyPut(() => LoginController());
    //  Contoller= Get.put(LoginController());


      return Padding(
        padding: const EdgeInsets.all(18.0),
        child: AnimatedContainer(


          duration: Duration(milliseconds: 500),
          width: Get.width * .55,
          height: Get.height * .07,
          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(50),
            boxShadow:isButtonpressed?[]: [
              BoxShadow(
                color: Colors.grey.shade400,
                offset: Offset(3, 5),
                blurRadius: 1,
                spreadRadius: 1,
                 // blurStyle: BlurStyle.outer
              ),
               BoxShadow(
                   color: Colors.white,
                   offset: Offset(-6, -6),
                   blurRadius: 10,
                   spreadRadius: 1,
                // blurStyle: BlurStyle.outer
              //
               ),
            ],
            // gradient:  LinearGradient(colors: [
            //   Color.fromRGBO(76, 178, 229, 1),
            //   Color.fromRGBO(44, 157, 215, 1)

            //  ]
            // ),
            color: Colors.black
          ),
          child: TextButton(
            onPressed: onPress,
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                   Text(
                     '$string',
                     style:  TextStyle(
                       fontSize: 20,
                       fontWeight: FontWeight.w500,
                       fontFamily: 'Poppins',
                       color:isButtonpressed? Colors.blueGrey:Colors.white,
                     ),
                   )


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
