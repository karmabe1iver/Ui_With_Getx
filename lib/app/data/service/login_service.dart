import 'dart:developer';

import 'package:dio/dio.dart';

import '../../utils/err_m.dart';
import '../../utils/mydio.dart';
import '../apimssg.dart';
import '../apires.dart';

abstract class LoginServices {
  static Future<ApiResp> fetchUser(String userId, String pswd) async {
    dynamic resp;
    await errMAsync(
          () async {
        resp = await MyDio().customPost(
          'token/',
          data: {'email': userId, 'password': pswd},
        );
      },
      title: 'Login Failed',
    );

    if (resp is DioError) {
      // if (resp.response?.statusCode == 400) {
      //   log('400 >> ${resp.response}');
      //   showMsg("Invalid UserName or Password", "Login Failed");
      // }
      if (resp.type == DioErrorType.connectTimeout) {
        showMsg(
            'Connection timed-out. Check internet connection.', "Login Failed");
      }
      if (resp.type == DioErrorType.receiveTimeout) {
        showMsg('Unable to connect to the server', "Login Failed");
      }
      // if (resp.type == DioErrorType.other) {
      //   showMsg(
      //       'Something went wrong with server communication', "Login Failed");
      // }
    } else {
      respNew = resp != null
          ? ApiResp(
        ok: true,
        rdata: resp,
        msgs: [
          ApiMsg(
            msg: "",
            msgType: "",
            title: "Success",
          )
        ],
      )
          : ApiResp(
        ok: false,
        rdata: "",
        msgs: [
          ApiMsg(
            msg: "Server response failed",
            msgType: "0",
            title: "Failed",
          )
        ],
      );
    }
    return respNew;
  }
 }
