import 'package:flutter/material.dart';

class BezierTest2 extends StatefulWidget {
  const BezierTest2({super.key});

  @override
  State<BezierTest2> createState() => _BezierTest2State();
}

class _BezierTest2State extends State<BezierTest2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Container(height: 10),
          CustomPaint(
            size: Size(MediaQuery.sizeOf(context).width, 120),
            painter: Clipper1(),
          ),
          Stack(
            children: [
              Center(
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.pinkAccent.withOpacity(0.3),
                    shape: BoxShape.circle, // 设置形状为圆形
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 25),
                child: CustomPaint(
                  size: Size(MediaQuery.sizeOf(context).width, 50),
                  painter: Clipper2(),
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 25),
                child: CustomPaint(
                  size: Size(MediaQuery.sizeOf(context).width, 50),
                  painter: Clipper3(),
                ),
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 36),
                  alignment: Alignment.bottomCenter,
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.pinkAccent.withOpacity(0.3),
                    shape: BoxShape.circle, // 设置形状为圆形
                  ),
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: CustomPaint(
                  size: Size(MediaQuery.sizeOf(context).width, 130),
                  painter: Clipper4(),
                ),
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 30),
                  alignment: Alignment.bottomCenter,
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.pinkAccent,
                    shape: BoxShape.circle, // 设置形状为圆形
                  ),
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: CustomPaint(
                  size: Size(MediaQuery.sizeOf(context).width, 130),
                  painter: Clipper5(),
                ),
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  alignment: Alignment.bottomCenter,
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.pinkAccent,
                    shape: BoxShape.circle, // 设置形状为圆形
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/lily.png',
                      height: 50,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Clipper1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.greenAccent // 设置画笔颜色
      ..style = PaintingStyle.stroke // 绘制样式为描边
      ..strokeWidth = 3.0; // 设置描边的宽度
    var path = Path();
    path.moveTo(0, 0);
    path.cubicTo(30, 0, 40, 90, 120, 90);
    path.cubicTo(210, 90, 210, 0, 240, 0);
    canvas.drawPath(path, paint); // 绘制路径
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false; // 判断是否需要重绘
}

class Clipper2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.greenAccent // 设置画笔颜色
      ..style = PaintingStyle.stroke // 绘制样式为描边
      ..strokeWidth = 3.0; // 设置描边的宽度
    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width / 2 - 80, 0);

    path.cubicTo(
        size.width / 2 - 30, 0, size.width / 2 - 30, 30, size.width / 2, 30);
    path.cubicTo(size.width / 2 + 30, 30, size.width / 2 + 30, 0,
        size.width / 2 + 80, 0);
    path.lineTo(size.width, 0);
    canvas.drawPath(path, paint); // 绘制路径
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false; // 判断是否需要重绘
}

class Clipper3 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.greenAccent // 设置画笔颜色
      ..style = PaintingStyle.stroke // 绘制样式为描边
      ..strokeWidth = 3.0; // 设置描边的宽度
    var path = Path();
    path.moveTo(0, 55);
    path.lineTo(size.width / 2 - 80, 55);

    path.cubicTo(
        size.width / 2 - 30, 55, size.width / 2 - 30, 30, size.width / 2, 30);
    path.cubicTo(size.width / 2 + 30, 30, size.width / 2 + 30, 55,
        size.width / 2 + 80, 55);
    path.lineTo(size.width, 55);
    canvas.drawPath(path, paint); // 绘制路径
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false; // 判断是否需要重绘
}

class Clipper4 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
          ..color = Colors.greenAccent // 设置画笔颜色
          ..style = PaintingStyle.fill // 绘制样式为描边
        ; // 设置描边的宽度
    var path = Path();
    path.moveTo(0, 55);
    path.lineTo(size.width / 2 - 70, 55);

    path.cubicTo(
        size.width / 2 - 30, 55, size.width / 2 - 35, 20, size.width / 2, 20);
    path.cubicTo(size.width / 2 + 35, 20, size.width / 2 + 30, 55,
        size.width / 2 + 70, 55);
    path.lineTo(size.width, 55);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint); // 绘制路径
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false; // 判断是否需要重绘
}

class Clipper5 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.greenAccent // 设置画笔颜色
      ..style = PaintingStyle.fill; // 绘制样式为填充

    var path = Path();
// 左上角圆角
    path.moveTo(0, 45);
    path.quadraticBezierTo(0, 25, 20, 25);
    path.lineTo(size.width / 2 - 70, 25);

    path.cubicTo(
        size.width / 2 - 30, 25, size.width / 2 - 35, 0, size.width / 2, 0);
    path.cubicTo(size.width / 2 + 35, 0, size.width / 2 + 30, 25,
        size.width / 2 + 70, 25);

    // 右上角圆角
    path.lineTo(size.width - 20, 25);
    path.quadraticBezierTo(size.width, 25, size.width, 45);

    // 右下角圆角
    path.lineTo(size.width, size.height - 20);
    path.quadraticBezierTo(
        size.width, size.height, size.width - 20, size.height);
    path.lineTo(20, size.height);

    // 左下角圆角
    path.quadraticBezierTo(0, size.height, 0, size.height - 20);
    path.lineTo(0, 75);

    path.close();

    canvas.drawPath(path, paint); // 绘制路径
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false; // 判断是否需要重绘
}
