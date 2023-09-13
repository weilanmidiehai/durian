import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/custom_scaffold.dart';
import 'hr_controller.dart';
import 'widget/custom_container.dart';
import 'widget/pie_chart.dart';

class HRIndex extends StatelessWidget {
  HRIndex({Key? key}) : super(key: key);
  final HRController controller = Get.put(HRController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HRController>(
        init: controller,
        builder: (controller) {
          return CustomScaffold(
            title: '饼图',
            elevation: 0.5,
            body: ListView(
              children: [
                CustomContainer(
                  icon: const Icon(
                    Icons.radio_rounded,
                    color: Colors.lime,
                  ),
                  text1: '标题',
                  text2: '（小标题）',
                  widget: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomPieChart(
                        total: 2,
                        gList: controller.holidayList
                            .where((value) => value['value'] != 0)
                            .toList(),
                        translate: true,
                      ),
                      Expanded(
                          child: CustomIndicator(
                        iList: controller.holidayList,
                        translate: true,
                      ))
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
