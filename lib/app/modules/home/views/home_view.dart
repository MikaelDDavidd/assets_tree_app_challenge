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
                width: width * 0.4,
              )),
          body: Center(
            child: Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(8),
              child: Container(
                alignment: Alignment.centerLeft,
                height: containerHeight,
                width: containerWidth,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child:  Wrap(
                  spacing: width * 0.03,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                  //  Image.asset('assets/assets.png'),
                    Text('Jaguar unit')
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
