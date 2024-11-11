import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'test1.dart';

class TablePage extends StatelessWidget {
  const TablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('TablePage')),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.to(() => const Test1());
                },
                child: const Text('表格内回车跳转+搜索某一行'))
          ],
        ));
  }
}
