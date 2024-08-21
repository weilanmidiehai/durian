import 'package:flutter/material.dart';

class BezierCurve extends StatefulWidget {
  const BezierCurve({super.key});

  @override
  State<BezierCurve> createState() => _BezierCurveState();
}

class _BezierCurveState extends State<BezierCurve> {
// 使用 ValueNotifier 来管理状态
  ValueNotifier<bool> animalBoolean = ValueNotifier<bool>(false);
  ValueNotifier<int> animalCenterIndex = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const SizedBox(
            height: 20
          ),
// 自定义绘画组件
          CustomPaint(
            size: const Size(double.infinity, 70), // 设置画布的大小
            painter: CurvePainter(
              centerIndex: animalCenterIndex.value,
              booleanState: animalBoolean.value,
            ),
          ),
        ],
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  final int centerIndex; // 当前选中的索引
  final bool booleanState; // 布尔状态值

  CurvePainter({
    required this.centerIndex,
    required this.booleanState,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0XFF0DBEBF) // 设置画笔颜色
      ..style = PaintingStyle.fill; // 填充绘制样式

    final path = Path();
    final widthOfOne = size.width / 3; // 每一部分的宽度
    final centerWidthOfOneX = widthOfOne / 2; // 每部分的中心点 X 坐标
    final marginLeftAndRight = centerWidthOfOneX / 1.6; // 边缘到弧度的距离
    final controllerX = centerWidthOfOneX / 6; // 控制点的 X 坐标

// 开始绘制路径
    path.moveTo(0, 0);
    path.lineTo(marginLeftAndRight / 2, 0); // 从起点到第一个控制点
    path.cubicTo(
      marginLeftAndRight,
      0,
      centerWidthOfOneX - (centerWidthOfOneX - controllerX) / 2,
      size.height / 3,
      centerWidthOfOneX,
      size.height / 2.6,
    ); // 绘制第一个贝塞尔曲线
    path.cubicTo(
      centerWidthOfOneX + (centerWidthOfOneX - controllerX) / 2,
      size.height / 2.6,
      widthOfOne - marginLeftAndRight,
      0,
      widthOfOne - marginLeftAndRight / 2,
      0,
    ); // 绘制第二个贝塞尔曲线
    path.lineTo(size.width, 0); // 绘制到画布的右边缘
    path.lineTo(size.width, size.height); // 绘制到画布的底边缘
    path.lineTo(0, size.height); // 绘制到画布的左边缘
    path.close(); // 关闭路径，形成闭合区域

    canvas.drawPath(path, paint); // 绘制路径
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false; // 判断是否需要重绘
}
