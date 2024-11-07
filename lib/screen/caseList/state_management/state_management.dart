import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widget/inherited_widget.dart';
import 'widget/rx_inherited_provider.dart';
import 'widget/self_fulfillment_provider.dart';
import 'widget/value_listenable_builder.dart';

class StateManagement extends StatelessWidget {
  const StateManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("状态管理"),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Get.to(() => const RXProvider());
              },
              child: const Text("RX Provider")),
          ElevatedButton(
              onPressed: () {
                Get.to(() => const InheritedWidgetTestRoute());
              },
              child: const Text("数据共享（InheritedWidget）")),
          ElevatedButton(
              onPressed: () {
                Get.to(() => const ProviderRoute());
              },
              child: const Text("跨组件状态共享（自实现Provider）")),
          ElevatedButton(
              onPressed: () {
                Get.to(() => const ValueListenableRoute());
              },
              child: const Text("按需rebuild（ValueListenableBuilder）")),
        ],
      ),
    );
  }
}
