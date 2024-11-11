import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../module/case_list.dart';
import '../widget/listview_style.dart';
import 'caseList/show_webview.dart';
import 'case/logic.dart';
import 'case/widget/home_drawer.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final logic = Get.put(HomeLogic());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeLogic>(
        init: logic,
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Du',
              ),
              actions: [
                InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Icon(
                      logic.multiple.value
                          ? Icons.dashboard
                          : Icons.view_agenda,
                    ),
                  ),
                  onTap: () {
                    logic.setMultiple();
                  },
                ),
              ],
            ),
            drawer: HomeDrawer(logic: logic),
            body: Column(
              children: [
                InkWell(
                    onTap: () {
                      Get.to(const WebViewExample());
                    },
                    child: HomeLogic.widgetOptions[logic.selectedIndex]),
                Expanded(
                  child: GridView(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: logic.multiple.value ? 4 : 2,
                        //横轴三个子widget
                        childAspectRatio: 2.0, //宽高比为1时，子widget
                        mainAxisSpacing: 10, //主轴空隙间距
                        crossAxisSpacing: 10 //次轴空隙间距
                        ),
                    children: List.generate(
                      HomeList.homeList.length,
                      (int index) {
                        final item = HomeList.homeList[index];
                        return ListViewStyle(
                          listData: item,
                          callBack: () {
                            Get.toNamed(item.navigateScreen);
                          },
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
