import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/app_theme.dart';
import '../logic.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key, required this.logic});

  final HomeLogic logic;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              child: Center(
                  child: ClipOval(
                      child: Image.asset("assets/logo.png",
                          width: 100, height: 100, fit: BoxFit.cover)))),
          ListTile(
            title: Text('Home'.tr),
            leading: const Icon(Icons.home),
            selected: logic.selectedIndex == 0,
            onTap: () {
              logic.onItemTapped(0);
              Get.back();
            },
          ),
          ListTile(
            title: Text('changesTheme'.tr),
            leading: Icon(Get.isDarkMode ? Icons.sunny : Icons.nightlight),
            selected: logic.selectedIndex == 1,
            onTap: () {
              context.isDarkMode
                  ? Get.changeTheme(greenTheme)
                  : Get.changeTheme(darkGreenTheme);
              logic.onItemTapped(1);
              Get.back();
            },
          ),
          ListTile(
            title: Text("language".tr),
            leading: const Icon(Icons.language),
            selected: logic.selectedIndex == 2,
            onTap: () {
              logic.onItemTapped(2);
              // 切换语言
              if (Get.locale == const Locale('en', 'US')) {
                Get.updateLocale(const Locale('zh', 'CN'));
              } else {
                Get.updateLocale(const Locale('en', 'US'));
              }
              // Get.reset(); // 重置 GetX 的状态
              // Get.offAllNamed('/'); // 返回到根路由
              // Get.offAll(() => SplashScreen()); // 返回到应用的主入口
            },
          ),
        ],
      ),
    );
  }
}
