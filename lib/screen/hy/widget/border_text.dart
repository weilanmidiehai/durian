import 'package:flutter/material.dart';

class BorderText extends StatelessWidget {
  final String text;
  final Widget child;
  final Color color;
  final double borderWidth;
  final TextStyle textStyle;

  const BorderText({
    super.key,
    required this.text,
    required this.child,
    this.color = Colors.black,
    this.borderWidth = 1.0,
    this.textStyle = const TextStyle(color: Colors.black, fontSize: 12),
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned(
          top: -12,
          left: 4,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            // color: Colors.white,
            child: Text(
              text,
              style: textStyle,
            ),
          ),
        ),
        Positioned(
          bottom: -12,
          right: 4,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            // color: Colors.white,
            child: Text(
              text,
              style: textStyle,
            ),
          ),
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('Border Text Example')),
      body: Center(
        child: BorderText(
          text: 'Sample Text',
          child: Container(
            width: 200,
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
            ),
          ),
        ),
      ),
    ),
  ));
}
