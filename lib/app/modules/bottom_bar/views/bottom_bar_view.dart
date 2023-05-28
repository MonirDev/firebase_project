import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:firebase_project/app/utils/colors.dart';
import 'package:firebase_project/app/utils/constants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bottom_bar_controller.dart';

class BottomBarView extends GetView<BottomBarController> {
  const BottomBarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(
            () => Text(Constants.screensHeader[controller.currentIndex.value])),
        centerTitle: true,
      ),
      body: Obx(
        () => Constants.screens[controller.currentIndex.value],
      ),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.react,
        items: Constants.tabItemList,
        backgroundColor: AppColors.black,
        initialActiveIndex: controller.currentIndex.value,
        onTap: (int i) => controller.onItemTapped(i),
      ),
    );
  }
}
