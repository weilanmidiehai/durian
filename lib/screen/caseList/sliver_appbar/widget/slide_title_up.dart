import 'package:flutter/material.dart';

class SlideTitleUp extends StatelessWidget {
  const SlideTitleUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.lightGreen.withOpacity(0.6),
            flexibleSpace: const FlexibleSpaceBar(
              title: Text("标题标题标题"),
              centerTitle: true,
              collapseMode: CollapseMode.pin,
            ),
            expandedHeight: 230.0,
            floating: false,
            pinned: true,
            snap: false,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.more_horiz),
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
