import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes/app_pages.dart';
import 'util/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: greenTheme,
      darkTheme: darkGreenTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      // home:  const SplashScreen(),
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    );
  }
}
