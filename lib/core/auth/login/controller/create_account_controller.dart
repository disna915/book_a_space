import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../../utils/services/http_services/expections.dart';
import '../../../../utils/services/local_storage/flutter_secure_storage.dart';
import '../repos/login_repo.dart';

class CreateAccountController extends GetxController{
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final departmentController = TextEditingController();
  final emailController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final passwordController = TextEditingController();
  String? userTypeController;
  String? userTypeValue;
  findUserType(){
    if(userTypeController=="Traveller"){
      userTypeValue = "1";
    }
    if(userTypeController=="Co-ordinator"){
      userTypeValue = "0";
    }
    if(userTypeController=="Transporter"){
      userTypeValue = "2";
    }
  }
  checkAddAllFeilds(){
    if(firstNameController.text.isNotEmpty
    &&lastNameController.text.isNotEmpty
    &&departmentController.text.isNotEmpty
    &&emailController.text.isNotEmpty
    &&mobileNumberController.text.isNotEmpty&&
    passwordController.text.isNotEmpty&&
    userTypeValue!=null){
      fetchCreateAccountApi();
    }
    else{
      Get.snackbar(
        "Please fill All the feilds",
        "",
        snackPosition: SnackPosition.BOTTOM,
      );


    }
  }
  fetchCreateAccountApi(
      ) async {
    EasyLoading.show();
    update();

    try {
      var response =
      await LoginRepo.createAccount(
          department: departmentController.text,
          email: emailController.text,
          password: passwordController.text,
        firstName: firstNameController.text,
        lastName: lastNameController.text,

        mobileNumber: mobileNumberController.text,
        userType:int.parse(userTypeValue.toString())


      );
      print("enter");

      log("response"+response.toString());
      Get.snackbar(
       response.message,
        "Please Contact Co-ordinator for Login",
        snackPosition: SnackPosition.BOTTOM,
      );

      emailController.text = '';
      passwordController.text = '';
      firstNameController.text = " ";
      lastNameController.text = " ";
      mobileNumberController.text = " ";
      departmentController.text =" ";





      Get.toNamed("/loginPage");
      // String? admin = await PersistentStorage.read('adminID');
      // Routes.pushReplace(screen: DashboardView(admin: admin));
      // CommonWidget.showToast(
      //     message: '${response.first.status}', bgColor: Apc.green);
      String? userType = await PersistentStorage.read('user_type');
      // final userTypeController = Get.find<UserTypeController>();

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

}