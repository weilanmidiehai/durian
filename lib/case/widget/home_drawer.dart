import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../util/app_theme.dart';
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
                child: Image.asset(
                  "assets/lily.jpg",
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          ListTile(
            title: const Text('Home'),
            selected: logic.selectedIndex == 0,
            onTap: () {
              // Update the state of the app
              logic.onItemTapped(0);
              // Then close the drawer
              Get.back();
            },
          ),
          ListTile(
            title: Text(context.isDarkMode ? '切换白天模式' : '切换夜晚模式'),
            // Icon(Get.isDarkMode ? Icons.sunny :Icons.nightlight),
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
            title: const Text('School'),
            selected: logic.selectedIndex == 2,
            onTap: () {
              logic.onItemTapped(2);
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}
