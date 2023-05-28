import 'package:firebase_project/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

errorSnackBar(String message, [String? title]) => Get.snackbar(
      title ?? Constants.failed,
      message,
      padding: EdgeInsets.only(left: 10.sp),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.redAccent,
      icon: const Icon(Icons.error),
      colorText: Colors.white,
    );
