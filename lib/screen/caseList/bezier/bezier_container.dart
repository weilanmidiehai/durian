import 'package:flutter/material.dart';

class BezierContainer extends StatefulWidget {
  const BezierContainer({super.key});

  @override
  State<BezierContainer> createState() => _BezierContainerState();
}

class _BezierContainerState extends State<BezierContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Bezier')),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: CustomPaint(
            size: Size(MediaQuery.sizeOf(context).width, 0),
            painter: Clipper(),
            child: Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    alignment: Alignment.bottomCenter,
                    child: ClipOval(
                      child: Image.network(
                        'https://img2.baidu.com/it/u=1965355493,1942275847&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500',
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Clipper extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.green[100]! // 设置画笔颜色
      ..style = PaintingStyle.fill; // 绘制样式为填充

    var path = Path();
    // 圆角度
    double roundAngle = 20;
    // 中心
    double center = size.width / 2;
    // 切线y轴
    double tangentY = 0;
    // 初始y轴
    double initialY = 35;

    // 左上角圆角
    path.moveTo(0, initialY + roundAngle);
    path.quadraticBezierTo(0, initialY, roundAngle, initialY);
    path.lineTo(center - 50, initialY); //凸起的起点

    //三阶贝塞尔曲线（中间的凸起）
    path.cubicTo(
        center - 35, initialY, center - 36, tangentY, center, tangentY);
    path.cubicTo(
        center + 36, tangentY, center + 35, initialY, center + 50, initialY);

    // 右上角圆角
    path.lineTo(size.width - roundAngle, initialY);
    path.quadraticBezierTo(
        size.width, initialY, size.width, initialY + roundAngle);

    // 右下角圆角
    path.lineTo(size.width, size.height - roundAngle);
    path.quadraticBezierTo(
        size.width, size.height, size.width - roundAngle, size.height);
    path.lineTo(roundAngle, size.height);

    // 左下角圆角
    path.quadraticBezierTo(0, size.height, 0, size.height - roundAngle);
    path.lineTo(0, 75);

    path.close();

    canvas.drawPath(path, paint); // 绘制路径
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false; // 判断是否需要重绘
}
