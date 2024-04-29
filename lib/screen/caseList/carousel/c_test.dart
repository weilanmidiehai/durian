import 'package:flutter/material.dart';

class CTest extends StatefulWidget {
  const CTest({super.key});

  @override
  State<CTest> createState() => _CTestState();
}

class _CTestState extends State<CTest> with SingleTickerProviderStateMixin {
  // 图片列表
  List<String> imgList = [
    "assets/bg/2.png",
    "assets/bg/9.png",
    "assets/bg/7.png",
    "assets/bg/17.png",
    "assets/bg/5.png",
  ];

  late AnimationController _controller;
  late Animation<double> animation;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reset();
          setState(() {
            _currentIndex = (_currentIndex + 1) % imgList.length;
          });
          _controller.forward(); // 重新启动动画
        }
      });
    _currentIndex = 0;
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter 布局示例'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        height: 500,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // 左边的卡片
            Positioned(
              left: 20.0, // 调整位置
              child: Opacity(
                opacity: 0.8,
                child: SizedBox(
                  width: 120.0,
                  height: 200.0,
                  // color: Colors.blue,
                  child: Image.asset(
                    imgList[_prevIndex()],
                    // fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // 右边的卡片
            Positioned(
              right: 20.0, // 调整位置
              child: Opacity(
                opacity: 0.8,
                child: SizedBox(
                  width: 120.0,
                  height: 200.0,
                  // color: Colors.green,
                  child: Image.asset(
                    imgList[_nextIndex()],
                    // fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // 中间的卡片
            Center(
              child: SizedBox(
                width: 220.0,
                height: 300.0,
                // color: Colors.red,
                child: Image.asset(
                  imgList[_currentIndex],
                  // fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  int _prevIndex() {
    return (_currentIndex - 1 + imgList.length) % imgList.length;
  }

  int _nextIndex() {
    return (_currentIndex + 1) % imgList.length;
  }
}
