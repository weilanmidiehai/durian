import 'package:flutter/material.dart';

class BasicEffect extends StatelessWidget {
  const BasicEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.pinkAccent.withOpacity(0.6),
            title: const Text("标题"),
            expandedHeight: 230.0,
            floating: false,
            pinned: true,
            snap: false,
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
