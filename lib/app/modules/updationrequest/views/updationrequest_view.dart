import 'package:Lakshore/app/components/mbutton.dart';
import 'package:Lakshore/app/components/profiledetials.dart';
import 'package:Lakshore/app/components/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../components/dropdown.dart';
import '../../../data/profile.dart';
import '../../../utils/asset_helper.dart';
import '../controllers/updationrequest_controller.dart';

class UpdationrequestView extends GetView<UpdationrequestController> {
  const UpdationrequestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(),
      Image.asset(AssetHelper.component),
      Positioned(
        left: 16,
        top: 50,
        child: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back),
          iconSize: 30,
          color: Color.fromRGBO(44, 157, 215, 1),
        ),
      ),
      Positioned(
        top: 40,
        left: 25,
        right: 25,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  maxRadius: 48,
                  child: ClipOval(
                      child: ProfileList.length != 0
                          ? Image.file(
                              ProfileList.last.profilePic,
                              width: 130,
                              height: 130,
                              scale: 1,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(AssetHelper.profileIMAGE)),
                ),
              ],
            ),
            Form(
              child:
                  //Padding(
                  // padding: const EdgeInsets.only(left: 12.0,right: 12.0,top: 12),
                  // child:
                  Obx(
                () => AnimatedOpacity(
                  opacity: controller.animate.value ? 1 : 0,
                  duration: Duration(milliseconds: 220),
                  child: AnimatedPadding(
                    duration: Duration(milliseconds: 250),
                    padding: EdgeInsets.only(
                      top: controller.animate.value ? 0 : 350,
                      left: controller.animate.value ? 0 : 90,
                    ),
                    child: DetailsCard(
                      Dcolor: Colors.white,
                      heading: 'Updation Form',
                      Alignment: MainAxisAlignment.center,
                      TextStyle: TEXTSTYLE(
                        fontsize: 24.0,
                        fontweight: FontWeight.w500,
                        color: Color.fromRGBO(44, 157, 215, 1),
                      ),
                      wrap: Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.phone,
                            //maxLength: 13,
                            // initialValue: '+91',
                            style: TEXTSTYLE(
                                fontsize: 16.0,
                                fontweight: FontWeight.w400,
                                color: Colors.black),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              prefixIcon: Icon(
                                Icons.phone,
                                color: Color.fromRGBO(44, 157, 215, 1),
                              ),
                              labelText: 'New Phone number',
                              contentPadding: EdgeInsets.all(9),
                              prefixText: '+91',
                              // hintText: ' New Number  '
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            style: TEXTSTYLE(
                                fontsize: 16.0,
                                fontweight: FontWeight.w400,
                                color: Colors.black),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                prefixIcon: Image.asset(AssetHelper.emailIcon),
                                labelText: 'New Email ID',
                                contentPadding: EdgeInsets.all(9),
                                hintText: 'New Email'),
                          ),
                          Obx(
                            () => dropDownBox(
                                color: Colors.grey,
                                shadow: [BoxShadow(color: Colors.transparent)],
                                FunctioOnchanged: (String? value) {
                                  Clipboard.setData(ClipboardData());
                                  HapticFeedback.heavyImpact();
                                  // This is called when the user selects an item.
                                  controller.dropdownText.value = value!;
                                  print(controller.dropdownText.value);
                                },
                                ListItem: controller.df
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                ListValue: controller.dropdownText.value),
                          ),
                          // Center(
                          //   child: Text('Upload supporting Documents', style: TEXTSTYLE(
                          //     fontsize: 11.0,
                          //     fontweight: FontWeight.w300,
                          //   ),),
                          // ),
                          Obx(
                            () => InkWell(
                                onTap: () {
                                  controller.Filepick();
                                },
                                child: controller.Upload.value == false
                                    ? Row(
                                        children: [
                                          Text(
                                            ' Attachement if any',
                                            style: TEXTSTYLE(
                                              fontsize: 16.0,
                                              fontweight: FontWeight.w500,
                                            ),
                                          ),
                                          Icon(Icons.attach_file),
                                        ],
                                      )
                                    : Text(
                                        'Attachment Uploaded',
                                        style: TEXTSTYLE(
                                          fontsize: 15.0,
                                          fontweight: FontWeight.w500,
                                          color:
                                              Color.fromRGBO(44, 157, 215, 1),
                                        ),
                                      )),
                          ),
                          Container(
                            height: Get.height * .16,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            //  child:
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: TextFormField(
                                //controller: controller.Reson,
                                //autofocus: true,
                                maxLines: 1000,

                                // initialValue: 'Reason',
                                style: TEXTSTYLE(
                                  fontsize: 18.0,
                                  fontweight: FontWeight.w500,
                                ),
                                decoration: InputDecoration(
                                    //labelText: 'Reason',
                                    border: InputBorder.none,
                                    hintText: 'Reason'),
                              ),
                            ),
                          ),
                          Center(
                            child: MButton(
                              onPress: () {},
                              isButtonpressed: false,
                              string: 'Submit Request',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ]));
  }
}
