import 'dart:convert';

import 'dart:convert';

LoginErrResp loginErrRespFromJson(String str) => LoginErrResp.fromJson(json.decode(str));

String loginErrRespToJson(LoginErrResp data) => json.encode(data.toJson());

class LoginErrResp {
  LoginErrResp({
    this.success,
    this.message,
  });

  String? success;
  String? message;

  factory LoginErrResp.fromJson(Map<String, dynamic> json) => LoginErrResp(
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}
