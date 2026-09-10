

import 'dart:convert';

ValidateOtp validateOtpFromJson(String str) => ValidateOtp.fromJson(json.decode(str));

String validateOtpToJson(ValidateOtp data) => json.encode(data.toJson());

class ValidateOtp {
  bool success;
  String message;
  String data;
  int statusCode;

  ValidateOtp({
    required this.success,
    required this.message,
    required this.data,
    required this.statusCode,
  });

  factory ValidateOtp.fromJson(Map<String, dynamic> json) => ValidateOtp(
    success: json["success"],
    message: json["message"],
    data: json["data"],
    statusCode: json["statusCode"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data,
    "statusCode": statusCode,
  };
}
