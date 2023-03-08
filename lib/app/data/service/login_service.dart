import 'dart:developer';

import 'package:Lakshore/app/data/login_response.dart';
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
          '/login',
          data: {'email': userId, 'password': pswd},
        );
      },
      title: 'Login Success',
    );

    if (resp is DioError) {
      if (resp.response?.statusCode == 400) {
        log('400 >> ${resp.response}');
        showMsg("Invalid UserName or Password", "Login Failed");
      }
      if (resp.type == DioErrorType.connectionTimeout) {
        showMsg(
            'Connection timed-out. Check internet connection.', "Login Failed");
      }
      if (resp.type == DioErrorType.receiveTimeout) {
        showMsg('Unable to connect to the server', "Login Failed");
      }
      if (resp.type == DioErrorType.unknown) {
        showMsg(
            'Something went wrong with server communication', "Login Failed");
      }
    } else {
      respNew = resp != null
          ? ApiResp(
              ok: true,
              rdata: resp,
              msgs:  [

              ],
            )
          : ApiResp(
              ok: false,
              rdata: "",
              msgs: [
                ' failed'
              ],
            );
    }
    return respNew;
  }
}
