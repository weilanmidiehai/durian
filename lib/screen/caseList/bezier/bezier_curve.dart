import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bezier_container.dart';
import 'bezier_test1.dart';
import 'bezier_test2.dart';
import 'bezier_test3.dart';
import 'wavy_bezier_curve.dart';

class BezierCurve extends StatefulWidget {
  const BezierCurve({super.key});

  @override
  State<BezierCurve> createState() => _BezierCurveState();
}

class _BezierCurveState extends State<BezierCurve> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('贝塞尔曲线'),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Get.to(() => const BezierTest1());
              },
              child: const Text('普通贝塞尔曲线')),
          ElevatedButton(
              onPressed: () {
                Get.to(() => const WavyBezierCurve());
              },
              child: const Text('波浪形贝塞尔曲线实现')),
          ElevatedButton(
              onPressed: () {
                Get.to(() => const BezierTest2());
              },
              child: const Text('自己尝试画')),
          ElevatedButton(
              onPressed: () {
                Get.to(() => const BezierTest3());
              },
              child: const Text('一個底部導航欄樣式（半成品）')),
          ElevatedButton(
              onPressed: () {
                Get.to(() => const BezierContainer());
              },
              child: const Text('贝塞尔边框（最终想要的效果）')),
        ],
      ),
    );
  }
}
