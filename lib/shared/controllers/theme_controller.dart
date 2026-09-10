
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:get/get.dart';
class ThemeController extends GetxController {
  static ThemeController get to => Get.find();
  RxBool isDarkTheme = false.obs;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  ThemeController() {
    loadThemeFromStorage();
  }
  ThemeMode get theme => isDarkTheme.value ? ThemeMode.dark : ThemeMode.light;
  void toggleTheme(bool isDark) async {
    isDarkTheme.value = isDark;
    await _storage.write(key: 'isDarkTheme', value: isDark.toString());
    update();
  }
  void loadThemeFromStorage() async {
    String? themeValue = await _storage.read(key: 'isDarkTheme');
    isDarkTheme.value = themeValue == 'true';
    update();
  }
}