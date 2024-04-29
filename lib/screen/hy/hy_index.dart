import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'max_loan.dart';

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
                Get.to(() => const MAX());
              },
              child: const Text('MAX Loan 頁面'))
        ],
      ),
    );
  }
}
