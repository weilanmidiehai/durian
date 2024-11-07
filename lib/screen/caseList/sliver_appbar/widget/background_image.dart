import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.lightGreen.withOpacity(0.6),
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                "吹绿东风又一年",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              centerTitle: true,
              collapseMode: CollapseMode.pin,
              background: Image.network(
                  'https://pic4.zhimg.com/v2-57653722ea3116e2a0520c8a349ea843_r.jpg',
                  fit: BoxFit.fitWidth),
            ),
            expandedHeight: 230.0,
            floating: false,
            pinned: true,
            snap: false,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              color: Colors.white,
              onPressed: () {
                Get.back();
              },
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.add),
                color: Colors.white,
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.more_horiz),
                color: Colors.white,
                onPressed: () {},
              ),
            ],
          ),
          SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: SliverChildBuilderDelegate(
                (context, index) => ListTile(
                      title: Text("Item $index"),
                    ),
                childCount: 30),
          ),
        ],
      ),
    );
  }
}
