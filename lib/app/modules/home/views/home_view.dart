import 'package:assets_tree_app_challenge/app/widgets/custom_container.dart';
import 'package:assets_tree_app_challenge/app/widgets/tractian_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;
        final containerHeight = height * 0.1;
        final containerWidth = width * 0.9;
        return Scaffold(
          appBar: AppBar(
              backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
              centerTitle: true,
              title: TractianIcon(
                width: width * 0.6,
              )),
          body: Obx(() {
            if (controller.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }

            if (controller.errorMessage.isNotEmpty) {
              return Center(child: Text(controller.errorMessage.value));
            }

            return ListView.builder(
              itemCount: controller.companies.length,
              itemBuilder: (context, index) {
                final company = controller.companies[index];
                return GestureDetector(
                  child: Padding(
                    padding:  EdgeInsets.only(bottom: containerHeight * 0.3),
                    child: CustomContainer(
                      title: company.name,
                      containerHeight: containerHeight,
                      containerWidth: containerWidth,
                    ),
                  ),
                  onTap: () {
                    // Get.to(() => LocationsPage(companyId: company.id));
                  },
                );
              },
            );
          }),
        );
      },
    );
  }
}
