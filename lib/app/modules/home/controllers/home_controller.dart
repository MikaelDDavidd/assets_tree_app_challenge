import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
   // Observes the current theme
  var isDarkMode = false.obs;

  // Toggles between light and dark mode
  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
