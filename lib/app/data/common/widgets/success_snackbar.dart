import 'package:firebase_project/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

successSnackBar(String message, [String? title]) => Get.snackbar(
      title ?? '',
      message,
      padding: EdgeInsets.only(left: 10.sp),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: AppColors.black,
    );
