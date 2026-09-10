import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../../../constants/app_strings.dart';
import '../../../../utils/auth_services.dart';
import '../../../../utils/services/http_services/expections.dart';
import '../../../../utils/services/local_storage/flutter_secure_storage.dart';

import '../repos/login_repo.dart';
class LoginController extends GetxController{

  final emailController = TextEditingController();
  final passwordController = TextEditingController();



  fetchLoginApi(
      {
        required BuildContext context}) async {
    EasyLoading.show();
    update();

    try {
      var response =
      await LoginRepo.loginApi(emailId:emailController.text, password:passwordController.text);

      log(response.toString());
       emailController.text = " ";
      passwordController.text = '';
      await PersistentStorage.write(accessToken, response.data.accessToken);
      await PersistentStorage.write('refresh_token', response.data.refreshToken);
      await PersistentStorage.write(userTypeKey, response.data.userType.toString());
      await PersistentStorage.write(isLoggedInKey, "true");
      final userType = await PersistentStorage.read(userTypeKey);
      final isLogged = await PersistentStorage.read(isLoggedInKey);
      log("Stored userType: $userType");
      log("Stored isLoggedIn: $isLogged");
      await AuthService.saveLogin();

      if(userType=="2"){
        Get.toNamed('/transporterDashboard');
      }
      if(userType=="0"){
        Get.toNamed('/coordinatorDashboard');
      }
      if(userType=="1"){
        Get.toNamed('/travellerDashboard');
      }
    } on AppException catch (e) {
      Get.snackbar(
        e.message??"Invalid credential",
        " ",
        snackPosition: SnackPosition.BOTTOM,
      );

    }
    EasyLoading.dismiss();
    update();
  }


  Future<void> logoutUser() async {
    EasyLoading.show(status: 'Logging out...');

    try {

      await PersistentStorage.remove('accessToken');
      await PersistentStorage.remove('refresh_token');
      await PersistentStorage.remove('userTypeKey');
      await PersistentStorage.remove('isLoggedInKey');
      EasyLoading.dismiss();

      Get.offAllNamed('/login');
    } catch (e) {
      EasyLoading.dismiss();
      Get.snackbar('Error', 'Failed to logout. Try again.');
    }
  }





}
