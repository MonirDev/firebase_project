import 'package:firebase_project/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  SplashScreenView({Key? key}) : super(key: key);
  @override
  final controller = Get.put(SplashScreenController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.black,
        body: _buildBody(),
      ),
    );
  }

//Build Body with TweenAnimationBuilder
  Widget _buildBody() {
    return Center(
      child: SpinKitThreeInOut(
        color: AppColors.grey,
        size: 30.h,
      ),
    );
  }
}
