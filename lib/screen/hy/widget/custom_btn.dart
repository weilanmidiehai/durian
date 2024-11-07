import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({super.key, this.child, this.fn, this.borderRadius});

  final Widget? child;
  final double? borderRadius;
  final void Function()? fn;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.w),
      alignment: Alignment.center,
      child: InkWell(
        onTap: fn ?? () {},
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xfffeb31d), Color(0xfffd9a1c)], // 渐变色
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(borderRadius ?? 26.w), // 圆角
          ),
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
          child: child ?? Container(),
        ),
      ),
    );
  }
}
