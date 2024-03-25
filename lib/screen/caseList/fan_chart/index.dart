import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/show_web.dart';
import '../../../widget/custom_scaffold.dart';
import 'hr_controller.dart';
import 'widget/custom_container.dart';
import 'widget/pie_chart.dart';

class FanChart extends StatelessWidget {
  FanChart({Key? key}) : super(key: key);
  final HRController controller = Get.put(HRController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HRController>(
        global: false,
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
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: ElevatedButton(
                      onPressed: () {
                        Get.to(()=> const ShowWeb(
                          url: 'https://app.flchart.dev/#/pie',
                          // url:'https://apps.powerapps.com/play/e/default-f65f0d81-a2a9-4903-a388-63a7d734d7cc/a/feaa9628-224d-40f3-a5fa-adbfe6ee1590?tenantId=f65f0d81-a2a9-4903-a388-63a7d734d7cc',
                          // url: 'https://fairwoodfastfood.sharepoint.com/sites/Index',
                          title: '更多图形（插件范例网页）',
                        ));
                      },
                      child: const Text('更多图形（插件范例网页')),
                )
              ],
            ),
          );
        });
  }
}
