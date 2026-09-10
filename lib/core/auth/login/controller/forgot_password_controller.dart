import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../../../utils/services/http_services/expections.dart';
import '../repos/login_repo.dart';

class ForgotPasswordController extends GetxController{

  final emailController = TextEditingController();
  final otpController = TextEditingController();
  forgotPassword({required BuildContext context}) async {
    EasyLoading.show();
    update();
    try {
      var response =
      await LoginRepo.forgotPassword(emailId:emailController.text, );
      log(response.toString());
      if(response.statusCode==200){
        print("enter");
        Get.toNamed("/validate_otp");

      }
      else{
        emailController.clear();
        Get.snackbar(response.message.toString(), " ", snackPosition: SnackPosition.BOTTOM,);
      }

    } on AppException catch (e) {
      Get.snackbar(e.message??"Invalid credential", " ", snackPosition: SnackPosition.BOTTOM,);

    }
    EasyLoading.dismiss();
    update();
  }
  verifyOtp(){
    if(otpController.text.isNotEmpty){
      validateOtp();
    }
    else{
      Get.snackbar("Please enter the Otp", " ", snackPosition: SnackPosition.BOTTOM,);
    }
  }
  validateOtp() async {
    EasyLoading.show();
    update();
    try {
      var response =
      await LoginRepo.validateOtp(emailId:emailController.text,otp: otpController.text );
      log(response.statusCode.toString());
      if(response.statusCode==200){
        Get.snackbar("Otp Verified.", " ", snackPosition: SnackPosition.BOTTOM,);
        Get.toNamed("/loginPage");
      }
    } on AppException catch (e) {
      Get.snackbar(e.message??"Invalid credential", " ", snackPosition: SnackPosition.BOTTOM,);

    }
    EasyLoading.dismiss();
    update();
  }
}