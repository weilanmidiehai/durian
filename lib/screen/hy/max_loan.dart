import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MAX extends StatelessWidget {
  const MAX({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
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
                            child: Text('x5.000,000',
                            style: TextStyle(fontSize: 52.sp),
                            ),
                          ),
                        ),

                        Container(
                          alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(horizontal: 60.w,vertical: 30.h),

                            child: Image(image:const AssetImage('assets/image/time.png'),width: 800.w, ))


                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
