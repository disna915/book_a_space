import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:traveller_app/constants/app_assets.dart';
import '../controller/splash_controller.dart';
class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final SplashController controller = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    controller.splashController();
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Image.asset(
              AppAssets.splash_image,
              fit: BoxFit.cover, // makes image fit the screen
            ),
          ),
        ),
      ),
    );
  }
}
