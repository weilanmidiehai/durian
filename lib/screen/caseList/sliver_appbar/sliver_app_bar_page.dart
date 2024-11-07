import 'package:flutter/material.dart';

import 'widget/add_bar.dart';
import 'widget/background_image.dart';
import 'widget/basic_effect.dart';
import 'widget/slide_title_up.dart';

class SliverAppBarPage extends StatefulWidget {
  const SliverAppBarPage({super.key});

  @override
  State<SliverAppBarPage> createState() => _SliverAppBarPageState();
}

class _SliverAppBarPageState extends State<SliverAppBarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SliverAppBar'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BasicEffect(),
                    ),
                  );
                },
                child: const Text('基本效果')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SlideTitleUp(),
                    ),
                  );
                },
                child: const Text('滑动标题上移效果')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BackgroundImage()));
                },
                child: const Text('背景图片沉浸式')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const AddBar()));
                },
                child: const Text('添加bar')),
          ],
        ),
      ),
    );
  }
}
