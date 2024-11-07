import 'package:flutter/material.dart';

class BezierTest3 extends StatefulWidget {
  const BezierTest3({super.key});

  @override
  State<BezierTest3> createState() => _BezierTest3State();
}

class _BezierTest3State extends State<BezierTest3> {
  int animalCenterIndex = 0;
  bool animalBoolean = false;

  void _handleIndexChanged(int index) {
    setState(() {
      animalCenterIndex = index;
      animalBoolean = !animalBoolean;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Box Example'),
      ),
      body: Center(
        child: CustomBox(
          animalCenterIndex: animalCenterIndex,
          animalBoolean: animalBoolean,
          onIndexChanged: _handleIndexChanged,
        ),
      ),
    );
  }
}

class CustomBox extends StatelessWidget {
  final int animalCenterIndex;
  final bool animalBoolean;
  final Function(int) onIndexChanged;

  const CustomBox({
    super.key,
    required this.animalCenterIndex,
    required this.animalBoolean,
    required this.onIndexChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CustomPaint(
              size: Size(MediaQuery.of(context).size.width, 70),
              painter: CurvePainter(animalCenterIndex: animalCenterIndex),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () => onIndexChanged(0),
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: animalCenterIndex == 0 ? 50 : 10),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/logo.png',
                        height: 50,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => onIndexChanged(1),
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: animalCenterIndex == 1 ? 50 : 10),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/logo.png',
                        height: 50,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => onIndexChanged(2),
                  child: Container(
                    padding: EdgeInsets.only(
                        bottom: animalCenterIndex == 2 ? 50 : 10),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/logo.png',
                        height: 50,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 50),
          child: CustomPaint(
            size: Size(MediaQuery.of(context).size.width, 70),
            painter: CurvePainter1(),
          ),
        ),
      ],
    );
  }
}

class CurvePainter extends CustomPainter {
  final int animalCenterIndex;

  CurvePainter({required this.animalCenterIndex});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color(0XFF0DBEBF)
      ..style = PaintingStyle.fill;

    Path path = Path();
    double widthOfOne = size.width / 3;
    double centerWidthOfOneX = widthOfOne / 2;
    double marginLeftAndRight = centerWidthOfOneX / 1.6;
    double controllerX = centerWidthOfOneX / 6;
    double keyAnimal = widthOfOne * animalCenterIndex;

    path.moveTo(0, 0);
    path.lineTo(marginLeftAndRight / 2 + keyAnimal, 0);
    path.cubicTo(
      marginLeftAndRight + keyAnimal,
      0,
      centerWidthOfOneX - (centerWidthOfOneX - controllerX) / 2 + keyAnimal,
      size.height / 3,
      centerWidthOfOneX + keyAnimal,
      size.height / 2.6,
    );
    path.cubicTo(
      centerWidthOfOneX + (centerWidthOfOneX - controllerX) / 2 + keyAnimal,
      size.height / 2.6,
      widthOfOne - (marginLeftAndRight) + keyAnimal,
      0,
      widthOfOne - marginLeftAndRight / 2 + keyAnimal,
      0,
    );
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class CurvePainter1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color(0XFF0DBEBF)
      ..style = PaintingStyle.fill;

    Path path = Path();
    double widthOfOne = size.width / 3;
    double centerWidthOfOneX = widthOfOne / 2;
    double marginLeftAndRight = centerWidthOfOneX / 1.6;
    double controllerX = centerWidthOfOneX / 6;

    path.moveTo(0, 55);
    path.lineTo(marginLeftAndRight / 2, 55);
    path.cubicTo(
      marginLeftAndRight,
      55,
      centerWidthOfOneX - (centerWidthOfOneX - controllerX) / 2,
      size.height / 3,
      centerWidthOfOneX,
      size.height / 2.6,
    );
    path.cubicTo(
      centerWidthOfOneX + (centerWidthOfOneX - controllerX) / 2,
      size.height / 2.6,
      widthOfOne - (marginLeftAndRight),
      55,
      widthOfOne - marginLeftAndRight / 2,
      55,
    );
    path.lineTo(size.width, 55);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
