import 'dart:convert';
//
// CreateAccountResponse createAccountFromJson(String str) => CreateAccountResponse.fromJson(json.decode(str));
//
// String createAccountToJson(CreateAccountResponse data) => json.encode(data.toJson());
CreateAccountResponse createAccountFromJson(String str) =>
    CreateAccountResponse.fromJson(json.decode(str));

String createAccountToJson(CreateAccountResponse data) =>
    json.encode(data.toJson());


class CreateAccountResponse {
  bool success;
  String message;
  Data data;
  int statusCode;

  CreateAccountResponse({
    required this.success,
    required this.message,
    required this.data,
    required this.statusCode,
  });

  factory CreateAccountResponse.fromJson(Map<String, dynamic> json) => CreateAccountResponse(
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

  String firstName;
  String lastName;
  String department;
  String email;
  String mobileNumber;
  String password;


  Data({

    required this.firstName,
    required this.lastName,
    required this.department,
    required this.email,
    required this.mobileNumber,
    required this.password,

  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(

    firstName: json["firstName"],
    lastName: json["lastName"],
    department: json["department"].toString(),
    email: json["email"],
    mobileNumber: json["mobileNumber"],
    password: json["password"],

  );

  Map<String, dynamic> toJson() => {

    "firstName": firstName,
    "lastName": lastName,
    "department": department,
    "email": email,
    "mobileNumber": mobileNumber,
    "password": password,

  };
}
