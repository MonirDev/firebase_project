import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_project/app/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, _) => GetMaterialApp(
        title: "Application",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        theme: AppThemeData.themeData,
        locale: const Locale("en"),
      ),
    ),
  );
}
