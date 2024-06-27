import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cash.dart';
import 'max_loan.dart';
import 'repay.dart';

class HyIndex extends StatelessWidget {
  const HyIndex({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hy Index'),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Get.to(() => MAX());
              },
              child: const Text('MAX Loan 頁面')),
          ElevatedButton(
              onPressed: () {
                Get.to(() => Cash());
              },
              child: const Text('cash 頁面')),  ElevatedButton(
              onPressed: () {
                Get.to(() => const Repay());
              },
              child: const Text('還款 頁面')),
        ],
      ),
    );
  }
}
