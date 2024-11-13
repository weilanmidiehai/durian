import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../module/case_list.dart';
import '../../widget/listview_style.dart';
import '../caseList/show_webview.dart';

import 'home_drawer.dart';
import 'home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: controller,
        global: true,
        builder: ((controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text('home'.tr),
              actions: [
                InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Icon(
                      controller.multiple.value
                          ? Icons.dashboard
                          : Icons.view_agenda,
                    ),
                  ),
                  onTap: () {
                    controller.setMultiple();
                  },
                ),
              ],
            ),
            drawer: HomeDrawer(logic: controller),
            body: Column(
              children: [
                InkWell(
                    onTap: () {
                      Get.to(const WebViewExample());
                    },
                    child:
                        HomeController.widgetOptions[controller.selectedIndex]),
                Expanded(
                  child: GridView(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: controller.multiple.value ? 4 : 2,
                        //横轴三个子widget
                        childAspectRatio: 2.0, //宽高比为1时，子widget
                        mainAxisSpacing: 10, //主轴空隙间距
                        crossAxisSpacing: 10 //次轴空隙间距
                        ),
                    children: List.generate(
                      HomeList.homeList.length,
                      (int index) {
                        final item = HomeList.homeList[index];
                        final int count = HomeList.homeList.length;

                        final Animation<double> animation =
                            Tween<double>(begin: 0.0, end: 1.0).animate(
                                CurvedAnimation(
                                    parent: controller.animationController!,
                                    curve: Interval((1 / count) * index, 1.0,
                                        curve: Curves.fastOutSlowIn)));
                        controller.animationController?.forward();
                        return ListViewStyle(
                            listData: item,
                            animation: animation,
                            animationController: controller.animationController,
                            callBack: () {
                              Get.toNamed(item.navigateScreen);
                            });
                      },
                    ),
                  ),
                )
              ],
            ),
          );
        }));
  }
}
