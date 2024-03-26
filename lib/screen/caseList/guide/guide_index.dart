import 'package:flutter/material.dart';

class GuideIndex extends StatefulWidget {
  const GuideIndex({super.key});

  @override
  State<GuideIndex> createState() => _GuideIndexState();
}

class _GuideIndexState extends State<GuideIndex> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('新手引导'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {}, child: const Text('showcaseview插件')),
          ],
        ),
      ),
    );
  }
}
