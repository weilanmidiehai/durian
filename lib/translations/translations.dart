import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Translations extends StatelessWidget {
  const Translations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hello'.tr), // 使用 'hello' 的翻译
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('welcome'.tr), // 使用 'welcome' 的翻译
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // 切换语言
                if (Get.locale == const Locale('en', 'US')) {
                  Get.updateLocale(const Locale('zh', 'CN'));
                } else {
                  Get.updateLocale(const Locale('en', 'US'));
                }
              },
              child: Text("changesLanguage".tr),
            ),
          ],
        ),
      ),
    );
  }
}
