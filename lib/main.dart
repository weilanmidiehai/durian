import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'routes/app_pages.dart';
import 'translations/app_translations.dart';
import 'util/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(750, 1334),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Flutter Demo',
          theme: greenTheme,
          darkTheme: darkGreenTheme,
          themeMode: ThemeMode.system,
          debugShowCheckedModeBanner: false,
          // home:  const SplashScreen(),
          initialRoute: AppPages.initial,
          getPages: AppPages.routes,

          translations: AppTranslations(),
          locale: Locale('en', 'US'),
          // 默认语言
          fallbackLocale: Locale('en', 'US'), // 备用语言
        );
      },
    );
  }
}
