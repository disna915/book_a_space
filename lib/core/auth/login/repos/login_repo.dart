import 'package:traveller_app/core/auth/login/models/forgot_password_reponse.dart';

import '../../../../utils/services/http_services/endpoints.dart';
import '../../../../utils/services/http_services/http_client.dart';
import '../models/create_account_model.dart';
import '../models/loginresponse.dart';
import '../models/validate_otp_response_model.dart';

class LoginRepo{
  static Future<LoginResponse> loginApi(
      {required String emailId, required String password}) async {
    var response = await NetworkAdapter.shared.send(
        endPoint: EndPoint.login,
        params: {"email": emailId, "password": password});

    return loginResponseFromJson(response);
  }
  static Future<CreateAccountResponse> createAccount({

    required String firstName,
    required String lastName,
    required String department,
    required String email,
    required String mobileNumber,
    required String password,
    required int userType,
  }) async {
    var response = await NetworkAdapter.shared.send(
      endPoint: EndPoint.userRegistration,
      params: {

        "firstName": firstName,
        "lastName": lastName,
        "department": department,
        "mobileNumber": mobileNumber,
        "email": email,
        "password": password,
        "userType": userType,
      },

    );

    return createAccountFromJson(response);
  }
  static Future<ForgotPasswordReponse> forgotPassword(
      {required String emailId, }) async {
    var response = await NetworkAdapter.shared.send(
        endPoint: EndPoint.forgotPassword,
        params: {"email": emailId,});

    return forgotPasswordReponseFromJson(response);
  }
  static Future<ValidateOtp> validateOtp(
      {required String emailId,String? otp }) async {
    var response = await NetworkAdapter.shared.send(
        endPoint: EndPoint.validateOtp,
        params: {
          "email": emailId,
          "otp":otp
        });

    return validateOtpFromJson(response);
  }

}