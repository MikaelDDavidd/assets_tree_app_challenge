import 'package:assets_tree_app_challenge/app/data/models/model.dart';
import 'package:assets_tree_app_challenge/app/data/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var companies = <Company>[].obs;
  var locations = <Location>[].obs;
  var assets = <Asset>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  final ApiService apiService = ApiService();

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
    fetchCompanies();
    super.onInit();
  }

  void fetchCompanies() async {
    isLoading.value = true;
    try {
      var data = await apiService.fetchData('companies');
      companies.value = data.map((json) => Company.fromJson(json)).toList();
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchLocations(String companyId) async {
    isLoading.value = true;
    try {
      var data = await apiService.fetchData('companies/$companyId/locations');
      locations.value = data.map((json) => Location.fromJson(json)).toList();
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchAssets(String companyId) async {
    isLoading.value = true;
    try {
      var data = await apiService.fetchData('companies/$companyId/assets');
      assets.value = data.map((json) => Asset.fromJson(json)).toList();
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
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
