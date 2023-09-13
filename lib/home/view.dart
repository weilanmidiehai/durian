import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'widget/home_drawer.dart';
import '../module/home_list.dart';

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
                    logic.aaa();
                  },
                )
              ],
            ),
            drawer: HomeDrawer(logic: logic),
            body: Column(
              children: [
                HomeLogic.widgetOptions[logic.selectedIndex],
                Expanded(
                  child: GridView(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: logic.multiple.value ? 4 : 2,
                        //横轴三个子widget
                        childAspectRatio: 1.0, //宽高比为1时，子widget
                        mainAxisSpacing: 10, //主轴空隙间距
                        crossAxisSpacing: 10 //次轴空隙间距
                        ),
                    children: List.generate(
                      HomeList.homeList.length,
                      (int index) {
                        final item = HomeList.homeList[index];
                        return HomeListView(
                          listData: item,
                          callBack: () {
                            Navigator.push<dynamic>(
                              context,
                              MaterialPageRoute<dynamic>(
                                builder: (BuildContext context) =>
                                    item.navigateScreen!,
                              ),
                            );
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

class HomeListView extends StatelessWidget {
  const HomeListView({
    Key? key,
    this.listData,
    this.callBack,
  }) : super(key: key);

  final HomeList? listData;
  final VoidCallback? callBack;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        child: InkWell(
          onTap: callBack,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  listData!.imagePath,
                ),
                fit: BoxFit.fill, // 完全填充
              ),
            ),
            child: Text('${listData?.title}'),
          ),
        ),
      ),
    );
  }
}
