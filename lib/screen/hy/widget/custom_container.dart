import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {super.key,
      this.child,
      this.width,
      this.height,
      this.color,
      this.margin});

  final Widget? child;
  final double? width;
  final double? height;
  final Color? color;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin,
        width: width ?? 150,
        height: height,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(999),
            color: color,
            border:
                Border.all(color: Colors.grey.withOpacity(0.5), width: 1.0)),
        child: child);
  }
}
