import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bottom_appbar.dart';
import 'custom_navigation.dart';
import 'navigation_rail.dart';

class NavigationIndex extends StatefulWidget {
  const NavigationIndex({super.key});

  @override
  State<NavigationIndex> createState() => _NavigationIndexState();
}

class _NavigationIndexState extends State<NavigationIndex> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Get.to(() => const HomeScreen());
              },
              child: const Text('寬度小於640是底部導航大於是側面導航：NavigationRail')),
          ElevatedButton(
              onPressed: () {
                Get.to(() => const CustomNavigation());
              },
              child: const Text('NavigationRail樣式有侷限，自定義側面導航')),
          ElevatedButton(
              onPressed: () {
                Get.to(() => const BottomAppBarDemo());
              },
              child: const Text('底部導航欄，中間有個圓形圖標')),
        ],
      ),
    );
  }
}
