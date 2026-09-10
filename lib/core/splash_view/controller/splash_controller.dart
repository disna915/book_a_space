import 'package:get/get.dart';
class SplashController extends GetxController{
  void splashController(){
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed('/userType');
    });
  }
}