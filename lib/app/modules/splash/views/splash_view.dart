import 'dart:async';

import 'package:Lakshore/app/utils/local_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../app.dart';
import '../../../data/apires.dart';
import '../../../data/login_response.dart';
import '../../../data/service/login_service.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/asset_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool animate = false;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
    );
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    super.initState();
    startanimation();
    // Timer(const Duration(seconds: 5), () => Get.offNamed(Routes.LOGIN));
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          // direction: Axis.vertical,
          // alignment: WrapAlignment.center,
          // crossAxisAlignment: WrapCrossAlignment.center,
          // runSpacing: 12.0,
          children: [
            AnimatedPositioned(
                duration: Duration(milliseconds: 1200),
                right: animate ? 50 : -30,
                top: 260,
                child: AnimatedOpacity(
                    duration: Duration(milliseconds: 1900),
                    opacity: animate ? 1 : 0,
                    child: Image.asset(AssetHelper.logoImag))),
            AnimatedPositioned(
              duration: Duration(milliseconds: 1200),
              left: animate ? 80 : -30,
              bottom: 280,
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 1900),
                opacity: animate ? 1 : 0,
                child: Image.asset(
                  AssetHelper.images('splash.png'),
                ),
              ),
            ),
            // AnimatedPositioned(
            //   bottom: 60,
            //   left:16,
            //   right: animate?16:380,
            //   duration: Duration(milliseconds: 1200),
            //   child: AnimatedContainer(duration: Duration(milliseconds:1200),
            //       height: 20,
            //     //width: animate?10:0,
            //     color: Colors.blue.shade300,
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  Future startanimation() async {
    await Future.delayed(Duration(milliseconds: 800));
    setState(() => animate = true);
    await Future.delayed(Duration(milliseconds: 1800));
    loadUserEmailPassword();
  }

  void loadUserEmailPassword() async {
    var _email = LocalStore.getData("email") ?? "";
    var _password = LocalStore.getData("password") ?? "";
    print(_email);
    print(_password);
    if (_email != '' && _password != '') {
      final ApiResp resp = await LoginServices.fetchUser(_email, _password);
      if (resp.ok == false) {
        //MyUtils.msg(resp.msgs);
        Get.offNamed(Routes.LOGIN);
        // isLoggingProgress.value = false;
        return;
      }

      LoginResp user = LoginResp.fromJson(resp.rdata);
      List<Datum> us= user.data;
       print('::  ${us.last.employeeId}');
       App.User=us.last;
      //App.token = user.token ?? '';
      LocalStore.setData('Emp_id', us.last.employeeId);
      LocalStore.setData('user_name', us.last.name);
      LocalStore.setData('Cl_Bal', us.last.clBal);
      LocalStore.setData('pl_bal', us.last.plBal);
      LocalStore.setData('sic_bal', us.last.siklBal);
      Get.offNamed(
        Routes.DASHBOARD,
      );

      if (us!= null) {
        Get.offAllNamed(Routes.DASHBOARD);
      }
    } else {
      Get.offNamed(Routes.LOGIN);
    }
  }
}
