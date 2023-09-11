import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../util/app_theme.dart';
import 'logic.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final logic = Get.put(HomeLogic());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeLogic>(
        init: logic,
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Du',
              ),
            ),
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    child: Center(
                      child: ClipOval(
                        child: Image.network(
                          "https://cdn.pixabay.com/photo/2023/08/18/15/02/dog-8198719_1280.jpg",
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
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text(Get.isDarkMode ? '白天模式' : '夜晚模式'),
                    selected: logic.selectedIndex == 1,
                    onTap: () {
                      Get.isDarkMode
                          ? Get.changeTheme(greenTheme)
                          : Get.changeTheme(darkGreenTheme);
                      logic.onItemTapped(1);
                      // Then close the drawer
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text('School'),
                    selected: logic.selectedIndex == 2,
                    onTap: () {
                      logic.onItemTapped(2);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            body: Column(
              children: [
                const Text('data'),
                HomeLogic.widgetOptions[logic.selectedIndex],
              ],
            ),
          );
        });
  }
}
