
import 'dart:convert';

ForgotPasswordReponse forgotPasswordReponseFromJson(String str) => ForgotPasswordReponse.fromJson(json.decode(str));

String forgotPasswordReponseToJson(ForgotPasswordReponse data) => json.encode(data.toJson());

class ForgotPasswordReponse {
  bool success;
  String message;
  String data;
  int statusCode;

  ForgotPasswordReponse({
    required this.success,
    required this.message,
    required this.data,
    required this.statusCode,
  });

  factory ForgotPasswordReponse.fromJson(Map<String, dynamic> json) => ForgotPasswordReponse(
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
