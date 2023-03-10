import 'package:Lakshore/app/components/profiledetials.dart';
import 'package:Lakshore/app/components/textstyle.dart';
import 'package:Lakshore/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../app.dart';
import '../../../data/profile.dart';
import '../../../utils/asset_helper.dart';
import '../controllers/profiledetails_controller.dart';

class ProfiledetailsView extends GetView<ProfiledetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
              top:40,
              left: 25,
              right: 25,

              child: Column(children: [
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
               DetailsCard(
                        heading: 'Profile Details',
                        wrap: Wrap(direction: Axis.vertical, children: [
                          RichText(
                              text: TextSpan(
                                  text: 'Employee ID  :  ',
                                  style: _textStyle(),
                                  children: [
                                TextSpan(
                                  text:App.User.employeeId==null?'XXX XXXX':App.User.employeeId,
                                  style: _style(),
                                )
                              ])),
                          RichText(
                              text: TextSpan(
                                  text: 'Name :  ',
                                  style: _textStyle(),
                                  children: [
                                TextSpan(
                                  text:App.User.name==null? 'Amile':App.User.name,
                                  style: _style(),
                                )
                              ])),
                          RichText(
                              text: TextSpan(
                                  text: 'Gender  :  ',
                                  style: _textStyle(),
                                  children: [
                                TextSpan(
                                  text: 'Female',
                                  style: _style(),
                                )
                              ])),
                          RichText(
                              text: TextSpan(
                                  text: 'Email  :  ',
                                  style: _textStyle(),
                                  children: [
                                TextSpan(
                                  text:App.User.email ?? 'amile@gmail.com',
                                  style: _style(),
                                )
                              ])),
                          RichText(
                              text: TextSpan(
                                  text: 'Date Of Birth  :  ',
                                  style: _textStyle(),
                                  children: [
                                TextSpan(
                                  text:App.User.dob==null?'20 JAN 19'  :DateFormat.yMd().format(App.User.dob!).toString(),
                                  style: _style(),
                                )
                              ])),
                          RichText(
                              text: TextSpan(
                                  text: 'Phone Numer  :  ',
                                  style: _textStyle(),
                                  children: [
                                TextSpan(
                                  text:App.User.phone?? '7012345630',
                                  style: _style(),
                                )
                              ])),
                          RichText(
                              text: TextSpan(
                                  text: 'Qualification  :  ',
                                  style: _textStyle(),
                                  children: [
                                TextSpan(
                                  text:App.User.qualification?? '',
                                  style: _style(),
                                )
                              ])),
                          RichText(
                              text: TextSpan(
                                  text: 'Maritial Status  :  ',
                                  style: _textStyle(),
                                  children: [
                                TextSpan(
                                  text:App.User.maritalStatusId?? '',
                                  style: _style(),
                                )
                              ])),
                        ])),
                DetailsCard(
                  heading: 'Job details',
                  wrap: Wrap(direction: Axis.vertical, children: [
                    content(field: 'Branch', deatail: 'Kochi (not api)'),
                    content(field: 'Catogery', deatail: 'Nurse (not api)'),
                    content(field: 'Desigination', deatail: 'General Nurse (not api)'),
                    content(field: 'Date of joining', deatail:App.User.companyDoj==null?'':DateFormat.yMMMd().format(App.User.companyDoj!)?? '20 feb 2022'),
                  ]),
                ),
                DetailsCard(
                    heading: 'Bank Details',
                    wrap: Wrap(
                      direction: Axis.vertical,
                      children: [
                        content(
                            field: 'Account Holder Name', deatail:App.User.accountHolderName?? 'Amile Angel'),
                        content(
                            field: 'Account Number', deatail: App.User.accountNumber??'9998013456211'),
                        content(field: 'Bank name', deatail:App.User.bankName?? 'Axis Bank'),
                        content(field: 'IFSC code', deatail:App.User.ifscCode?? 'AXRl0000123'),
                        content(field: 'Branch', deatail:App.User.branchLocation?? '')
                      ],
                    )),
              ]),
            ),

        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 35.0, bottom: 40),
        child: FloatingActionButton(
          child: Icon(Icons.edit_calendar_outlined),
          backgroundColor: Color.fromRGBO(18, 132, 198, 1),
          onPressed: () {
            controller.startanimation();
            Get.toNamed(Routes.UPDATIONREQUEST);
          },
        ),
      ),
    );
  }
}

TextStyle _textStyle() {
  return TEXTSTYLE(
      fontweight: FontWeight.w700, fontsize: 14.0, color: Colors.black);
}

TextStyle _style() {
  return TEXTSTYLE(
      fontweight: FontWeight.w100, fontsize: 14.0, color: Colors.black);
}
