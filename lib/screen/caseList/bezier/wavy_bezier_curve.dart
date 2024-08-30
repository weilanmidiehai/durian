import 'package:flutter/material.dart';

class WavyBezierCurve extends StatefulWidget {
  const WavyBezierCurve({Key? key}) : super(key: key);

  @override
  State<WavyBezierCurve> createState() {
    return _WavyBezierCurveState();
  }
}

class _WavyBezierCurveState extends State<WavyBezierCurve> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ClipPath(
            clipper: BottomClipper(),
            child: Container(
              color: Colors.cyan,
              height: 200,
            ),
          )
        ],
      ),
    );
  }
}

class BottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // 创建路径对象
    var path = Path();

    // 从左上角 (0, 0) 绘制直线到左下角 (0, size.height - 40)
    // 这里的 40 像素偏移表示底部距离视图底部的距离
    path.lineTo(0, 0);//起点
    // 起点也可以用path.moveTo(0, 0) 将路径的起始点移动到左上角 (0, 0)


    path.lineTo(0, size.height - 40);

    // 绘制第一段贝塞尔曲线
    // 控制点在视图宽度的1/4处（size.width / 4），
    // 高度为视图的底部（size.height）
    // 结束点在视图宽度的2.25分之一处（size.width / 2.25），
    // 高度向上偏移30像素（size.height - 30）
    path.quadraticBezierTo(
        size.width / 4, size.height, // 控制点
        size.width / 2.25, size.height - 30 // 结束点
    );

    // 绘制第二段贝塞尔曲线
    // 控制点在视图宽度的3/4处（size.width / 4 * 3），
    // 高度向上偏移90像素（size.height - 90）
    // 结束点在视图的最右边（size.width），
    // 高度向上偏移40像素（size.height - 40）
    path.quadraticBezierTo(
        size.width / 4 * 3, size.height - 90, // 控制点
        size.width, size.height - 40 // 结束点
    );

    // 从结束点绘制直线到右下角 (size.width, size.height - 40)
    // 再绘制直线到右上角 (size.width, 0)
    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0);

    // 返回完整的路径
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // 这里返回 false，表示不需要重新裁剪
    // 可以提高性能
    return false;
  }
}
