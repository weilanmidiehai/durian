import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'coustom_row.dart';

class MAX extends StatelessWidget {
  const MAX({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: 600.h,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/image/bg.png'),
              fit: BoxFit.cover, // 图片填充方式
            ),
          ),
          child: Container(
            padding: EdgeInsets.fromLTRB(30.w, 0, 30.w, 5.5.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 120.h),
                  height: 260.h,
                  child: Image.asset(
                    'assets/image/logo.png',
                    width: 260.w,
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/image/card.png'),
                        fit: BoxFit.fitWidth, // 图片填充方式
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(36.w, 30.h, 36.w, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/image/max.jpg',
                                    width: 260.w,
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.fromLTRB(10.w, 0, 0, 3.w),
                                    child: Image.asset(
                                      'assets/image/Vector.png',
                                      width: 20.h,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'Product Detail',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.white,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 30.w),
                            child: Text(
                              'x5.000,000',
                              style: TextStyle(fontSize: 52.sp),
                            ),
                          ),
                        ),
                        Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: 60.w, vertical: 30.h),
                            child: Image(
                              image: const AssetImage('assets/image/time.png'),
                              width: 800.w,
                            ))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.w),
          child: CustomRow(
            row: SizedBox(
              width: 280.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: const AssetImage('assets/image/document_icon.png'),
                    width: 24.w,
                  ),
                  Text(
                    'How to get a loan?',
                    style: TextStyle(
                        fontSize: 24.0.w,
                        color: const Color(0xff7059f0),
                        fontWeight: FontWeight.bold), // 文字样式
                    textAlign: TextAlign.center, // 文本居中
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.w),
          alignment: Alignment.center,
          child: InkWell(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xfffeb31d), Color(0xfffd9a1c)], // 渐变色
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(22.w), // 圆角
              ),
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Apply Now', // 替换为你的文字
                    style: TextStyle(
                        fontSize: 30.w,
                        fontWeight: FontWeight.bold,
                        color: Colors.white), // 可以根据需要设置文字的样式
                  ),
                  const SizedBox(width: 10), // 调整图像和文字之间的间距
                  Image.asset(
                    'assets/image/btn.png', // 替换为你的图片路径
                    width: 24, // 调整图像的大小
                    height: 24,
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
