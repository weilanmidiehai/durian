import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IconIndex extends StatelessWidget {
  const IconIndex({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('svg圖標'),
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(children: [
            CustomCard(
                svgAsset: 'assets/add.svg',
                serialNum: 'SC01',
                text: '售賣類電子券\n查看及重新發送'),
            CustomCard(
                svgAsset: 'assets/add.svg',
                serialNum: 'SC02',
                text: '售賣類電子券\n查看及重新發送'),
          ]),
          Row(children: [
            CustomCard(
                svgAsset: 'assets/add.svg',
                serialNum: 'SC02',
                text: '售賣類電子券\n查看及重新發送'),
            CustomCard(
                svgAsset: 'assets/add.svg',
                serialNum: 'SC02',
                text: '售賣類電子券\n查看及重新發送'),
          ]),
          SizedBox(height: 20),
          Row(children: [BBB(), SizedBox(width: 10), BBB()]),
          SizedBox(height: 10),
          Row(children: [BBB(), SizedBox(width: 10), BBB()]),
        ],
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard(
      {super.key,
      required this.svgAsset,
      required this.serialNum,
      required this.text});

  final String svgAsset;
  final String serialNum;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 200,
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  svgAsset,
                  height: 50,
                  width: 50,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.black12, // 圆的背景色
                    borderRadius: BorderRadius.circular(100), // 圆角半径
                  ),
                  child: Text(
                    serialNum,
                    style: const TextStyle(
                      color: Colors.white, // 文字颜色
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class BBB extends StatelessWidget {
  const BBB({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: CustomPaint(
        size: const Size(0, 0),
        painter: Clipper(),
        child: Container(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 50,
                  // 圆的宽度
                  height: 50,
                  // 圆的高度
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Colors.white70, // 圆的背景色
                    shape: BoxShape.circle, // 将容器变为圆形
                    boxShadow: [
                      // 内阴影的模拟效果
                      BoxShadow(
                        color: Colors.black26, // 阴影颜色
                        offset: Offset(0, 0), // 阴影的偏移 (左上角)
                        blurRadius: 1, // 模糊半径
                      ),
                      BoxShadow(
                        color: Colors.white, // 高光颜色
                        offset: Offset(4, 4), // 阴影的偏移 (右下角)
                        blurRadius: 3, // 模糊半径
                      ),
                    ],
                  ),
                  child: SvgPicture.asset(
                    'assets/add.svg',
                    semanticsLabel: '添加收藏',
                    // height: 20,
                    // width: 20,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text('SC02-售賣類電子券'),
              const Text('查看及重新發送')
            ],
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
      ..color = Colors.white // 设置画笔颜色
      ..style = PaintingStyle.fill; // 绘制样式为填充
    Paint shadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.2)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3); // 设置阴影模糊

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

    // 绘制阴影
    canvas.save();
    canvas.translate(1, 1); // 阴影的偏移量
    canvas.drawPath(path, shadowPaint);
    canvas.restore();

    // 绘制路径
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false; // 判断是否需要重绘
}
