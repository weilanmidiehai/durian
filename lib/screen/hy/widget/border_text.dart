import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BorderText extends StatelessWidget {
  final String text;
  final double borderWidth;
  final List list;
  final TextStyle? textStyle;

  const BorderText({
    super.key,
    required this.text,
    this.borderWidth = 1.0,
    this.textStyle,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            margin: EdgeInsets.symmetric(vertical: 28.w),
            padding: EdgeInsets.fromLTRB(18.w, 20.h, 18.w, 12.h),
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.withOpacity(0.3), width: 1),
              borderRadius: BorderRadius.circular((18.0.w)), // 圆角
            ),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                final item = list[index];
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 12.h),
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(width: 1, color: Color(0xffe5e5e5)))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${item['name']}',
                        style: const TextStyle(color: Colors.black45),
                      ),
                      Text('${item['value']}',
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                );
              },
            )),
        Positioned(
          top: 0,
          left: 18,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            color: Colors.white,
            child: Text(
              text,
              style: textStyle ??
                  TextStyle(
                      fontSize: 36.sp,
                      color: const Color(0xfffc7a3e),
                      fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
