
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_assets.dart';
class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();
  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }
  void _updateConnectionStatus(List<ConnectivityResult> connectivityResult) {
    if (connectivityResult.contains(ConnectivityResult.none)) {
      if (Get.isDialogOpen == false) {
        Get.defaultDialog(
          title: 'No Internet',
          content: Image.asset(AppAssets.noInternetConnection),
          barrierDismissible: false,
        );
      }
    } else {
      if (Get.isDialogOpen == true) {
        Get.back();
      }
    }
  }
}

