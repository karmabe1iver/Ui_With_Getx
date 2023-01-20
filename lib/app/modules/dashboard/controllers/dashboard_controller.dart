import 'dart:io';

import 'package:Lakshore/app/data/profile.dart';
import 'package:Lakshore/app/utils/asset_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class DashboardController extends GetxController {


  Rx<bool> status= false.obs;
  Rx< File?> image=File('super').obs;
  final ImagePicker imagepicked = ImagePicker();
  final count = 0.obs;

  Future getImage() async {
    try {
      // var imagepicked = await ImagePicker();
      final XFile? pickedFile = await imagepicked.pickImage(
        source: ImageSource.gallery,

        imageQuality: 100,
      );
      File file = File(pickedFile!.path);
      //image = await ImagePicker().pickImage(source: ImageSource.gallery);
      // XFile?  image1 = await imagepicked.pickImage(source: ImageSource.camera);

      image.value = file;
      ProfileList.add(ProfileModel(
          profilePic: image.value!,
      ));
      if(file!=null){
        status.value=true;

      }
    }
    catch (e){
        Image.asset(AssetHelper.profileIMAGE);
    }
    // print('Image Path $image');


  }
  Future getImageCam() async {
    // var imagepicked = await ImagePicker();
    final XFile? pickedFile = await imagepicked.pickImage(source: ImageSource.camera,

      imageQuality: 100,
      preferredCameraDevice: CameraDevice.rear,
    );
    File file = File(pickedFile!.path);
    //image = await ImagePicker().pickImage(source: ImageSource.gallery);
    // XFile?  image1 = await imagepicked.pickImage(source: ImageSource.camera);

    image.value=file;
    ProfileList.add(ProfileModel(profilePic:  image.value!,

    ));
    if(file!=null){
      status.value=true;

    }
    // print('Image Path $image');


  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
