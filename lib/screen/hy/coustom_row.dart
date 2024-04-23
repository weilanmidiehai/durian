import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRow extends StatelessWidget {
  const CustomRow({super.key, required this.row, this.color});


  final Widget  row;
  final Color? color;


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0), // 圆角
            child: Container(
              color: color ?? const Color(0xffddd7fc), // 底色
              height: 12.0.w, // 底色高度
              width: double.infinity, // 撑满父容器的宽度
            ),
          ),
        ),
        row,
      ],
    );
  }
}
