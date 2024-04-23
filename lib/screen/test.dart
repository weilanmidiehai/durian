import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Text with Background Color'),
        ),
        body: Center(
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0), // 圆角
                  child: Container(
                    color: Colors.yellow, // 底色
                    height: 12.0, // 底色高度
                    width: double.infinity, // 撑满父容器的宽度
                  ),
                ),
              ),
              Container(
                width: 200,
                child: const Text(
                  'Sample Text',
                  style: TextStyle(fontSize: 24.0), // 文字样式
                  textAlign: TextAlign.center, // 文本居中
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
