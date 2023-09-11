import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../util/app_theme.dart';
import 'logic.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final logic = Get.put(HomeLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Du',
        ),
      ),
      body: Column(
        children: [
          const Text('data'),
          ElevatedButton(
              onPressed: () {
                Get.isDarkMode
                    ? Get.changeTheme(greenTheme)
                    : Get.changeTheme(darkGreenTheme);
              },
              child: const Text('变换主题'))
        ],
      ),
    );
  }
}
