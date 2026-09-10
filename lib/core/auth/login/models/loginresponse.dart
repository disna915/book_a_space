

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) =>
    json.encode(data.toJson());

class LoginResponse {
  bool success;
  String message;
  Data data;
  int statusCode;

  LoginResponse({
    required this.success,
    required this.message,
    required this.data,
    required this.statusCode,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    success: json["success"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
    statusCode: json["statusCode"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data.toJson(),
    "statusCode": statusCode,
  };
}

class Data {
  String name;
  String email;
  String mobileNumber;
  String department;
  int userType;
  String accessToken;
  String refreshToken;
  DateTime refreshTokenExpiryTime;

  Data({
    required this.name,
    required this.email,
    required this.mobileNumber,
    required this.department,
    required this.userType,
    required this.accessToken,
    required this.refreshToken,
    required this.refreshTokenExpiryTime,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    email: json["email"],
    mobileNumber: json["mobileNumber"],
    department: json["department"],
    userType: json["userType"],
    accessToken: json["accessToken"],
    refreshToken: json["refreshToken"],
    refreshTokenExpiryTime: DateTime.parse(json["refreshTokenExpiryTime"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "mobileNumber": mobileNumber,
    "department": department,
    "userType": userType,
    "accessToken": accessToken,
    "refreshToken": refreshToken,
    "refreshTokenExpiryTime": refreshTokenExpiryTime.toIso8601String(),
  };
}
