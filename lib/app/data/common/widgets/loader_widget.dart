import 'package:firebase_project/app/utils/colors.dart';
import 'package:firebase_project/app/utils/constants.dart';
import 'package:firebase_project/app/utils/spacer_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

loaderOverlay() {
  return Get.dialog(
    AlertDialog(
      contentPadding: EdgeInsets.symmetric(vertical: 8.sp, horizontal: 20.sp),
      content: SizedBox(
        height: 40.sp,
        child: Row(
          children: [
            Text(
              Constants.pleaseWait,
              style: AppTextStyle.nb18,
            ),
            SpacerWidget.w10,
            LoadingAnimationWidget.waveDots(
              color: AppColors.black,
              size: 30,
            ),
          ],
        ),
      ),
    ),
    barrierDismissible: false,
  );
}
