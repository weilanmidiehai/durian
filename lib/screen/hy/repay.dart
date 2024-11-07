import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widget/custom_btn.dart';

class Repay extends StatelessWidget {
  const Repay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Repay'),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(30.w, 40.h, 30.w, 20.h),
        child: Column(
          children: [
            Container(
                height: 516.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/image/repay/card.png'),
                    fit: BoxFit.fitWidth, // 图片填充方式
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 415.h,
                      child: Column(
                        children: [
                          Text(
                            'Prodect Name',
                            style: TextStyle(
                                fontSize: 30.sp, fontWeight: FontWeight.bold),
                          ),
                          RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                              style: const TextStyle(color: Colors.white),
                              children: <TextSpan>[
                                TextSpan(
                                    text: '₦ ',
                                    style: TextStyle(
                                      fontSize: 50.sp,
                                      fontWeight: FontWeight.bold,
                                    )),
                                TextSpan(
                                    text: '10,686',
                                    style: TextStyle(
                                      fontSize: 60.sp,
                                      fontWeight: FontWeight.bold,
                                    )),
                                const TextSpan(
                                  text: '₦10,686',
                                  style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: Colors.red,
                                    // fontSize: 25.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Repayment Amount',
                              ),
                              SizedBox(
                                width: 200.w,
                                child: CustomBtn(
                                  borderRadius: 999,
                                  child: Text(
                                    'EXtend',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        child: RichText(
                      text: const TextSpan(children: [
                        TextSpan(
                            text: "Effective period of interest reduction",
                            style: TextStyle(color: Color(0xff683ef5))),
                        TextSpan(
                            text: "23:59:59",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold))
                      ]),
                    )),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
