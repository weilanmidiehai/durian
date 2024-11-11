import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddBar extends StatefulWidget {
  const AddBar({super.key});

  @override
  State<AddBar> createState() => _AddBarState();
}

class _AddBarState extends State<AddBar> {
  @override
  Widget build(BuildContext context) {
    var tabs = <String>[];
    tabs = ["Tab 1", "Tab 2", "Tab 3"];
    return Scaffold(
      body: DefaultTabController(
        length: tabs.length,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  backgroundColor: const Color(0xffc6d1ea),
                  leading: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      color: Colors.white,
                      onPressed: () {
                        Get.back();
                      }),
                  title: const Text(
                    '标题',
                    style: TextStyle(color: Colors.white),
                  ),
                  centerTitle: false,
                  pinned: true,
                  floating: false,
                  snap: false,
                  primary: true,
                  expandedHeight: 230.0,
                  elevation: 10,
                  //是否显示阴影，直接取值innerBoxIsScrolled，展开不显示阴影，合并后会显示
                  forceElevated: innerBoxIsScrolled,
                  actions: [
                    IconButton(
                        color: Colors.white,
                        icon: const Icon(Icons.more_horiz),
                        onPressed: () {})
                  ],

                  flexibleSpace: FlexibleSpaceBar(
                      background: Image.network(
                          'https://img1.baidu.com/it/u=3306093202,3782418201&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=500',
                          fit: BoxFit.cover)),

                  bottom: TabBar(
                    indicatorColor: const Color(0xff734e30),
                    labelColor: const Color(0xff734e30),
                    unselectedLabelColor: Colors.white,
                    tabs: tabs.map((String name) => Tab(text: name)).toList(),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: tabs.map((String name) {
              //SafeArea 适配刘海屏的一个widget
              return SafeArea(
                top: false,
                bottom: false,
                child: Builder(
                  builder: (BuildContext context) {
                    return CustomScrollView(
                      key: PageStorageKey<String>(name),
                      slivers: [
                        SliverOverlapInjector(
                          handle:
                              NestedScrollView.sliverOverlapAbsorberHandleFor(
                                  context),
                        ),
                        SliverPadding(
                          padding: const EdgeInsets.all(10.0),
                          sliver: SliverFixedExtentList(
                            itemExtent: 50.0, //item高度或宽度，取决于滑动方向
                            delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                                return ListTile(
                                  title: Text('Item $index'),
                                );
                              },
                              childCount: 30,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            }).toList(),
          ),
        ),
      ),

      /// 不加TabBar

//       CustomScrollView(
//        slivers: [
//           SliverAppBar(
//            leading:  IconButton(
//              icon: Icon(Icons.arrow_back),
//              onPressed: () {},
//            ),
//
//            title: Text("标题"),
//
//            actions: [
//               IconButton(
//                icon: Icon(Icons.add),
//                onPressed: () {
//                  print("添加");
//                },
//              ),
//               IconButton(
//                icon: Icon(Icons.more_horiz),
//                onPressed: () {
//                  print("更多");
//                },
//              ),
//            ],
//
//            expandedHeight: 230.0,
//            floating: false,
//            pinned: true,
//            snap: false,
//            brightness: Brightness.dark,
//
//            flexibleSpace:  FlexibleSpaceBar(
//              background: Image.asset("images/a.jpg", fit: BoxFit.fill),
//            ),
//
//          ),
//           SliverFixedExtentList(
//            itemExtent: 50.0,
//            delegate:  SliverChildBuilderDelegate(
//              (context, index) =>  ListTile(
//                    title:  Text("Item $index"),
//                  ),
//              childCount: 30,
//            ),
//          ),
//        ],
//      ),
    );
  }
}
