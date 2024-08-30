import 'package:flutter/material.dart';

class BezierTest1 extends StatefulWidget {
  const BezierTest1({super.key});

  @override
  State<BezierTest1> createState() => _BezierTest1State();
}

class _BezierTest1State extends State<BezierTest1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ClipPath(
            clipper: BottomClipper(),
            child: Container(
              height: 300,
              decoration: const BoxDecoration(
                color: Colors.orangeAccent,

                // borderRadius: BorderRadius.circular(15), // 圆角
                boxShadow: [
                  BoxShadow(
                    color: Colors.black, // 阴影颜色和透明度
                    spreadRadius: 5, // 阴影扩散半径
                    blurRadius: 10,  // 模糊半径
                    offset: Offset(0, -5), // 阴影偏移量 (x, y)
                  ),
                ],
              ),
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
    var path = Path();
    path.lineTo(0, 0); //第一个点
    path.lineTo(0, size.height - 60); //第二个点
    var firstControlPoint = Offset(size.width / 2, size.height); //曲线的控制点
    var firstEndPoint = Offset(size.width, size.height - 60); // 曲线结束点
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.lineTo(size.width, size.height - 60); //第四个点
    path.lineTo(size.width, 0); // 第五个点
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
