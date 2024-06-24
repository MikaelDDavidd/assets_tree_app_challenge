import 'package:assets_tree_app_challenge/app/modules/home/controllers/home_controller.dart';
import 'package:assets_tree_app_challenge/app/utilities/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  Get.put(HomeController());
  runApp(
    GetMaterialApp(
      title: "Application",
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode:
          HomeController().isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
      getPages: AppPages.routes,
      initialRoute: AppPages.INITIAL,
      debugShowCheckedModeBanner: false,
    ),
  );
}
