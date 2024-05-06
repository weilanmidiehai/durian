import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'cash_controller.dart';
import 'widget/border_text.dart';
import 'widget/custom_btn.dart';
import 'widget/custom_card.dart';

class Cash extends StatelessWidget {
  final dataController = Get.put(CashController());

  Cash({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CashController>(
        init: dataController,
        global: false,
        builder: ((controller) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('xxx Cash'),
            ),
            body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff6345d6), Color(0xff8a5be8)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: ListView(
                children: [
                  Container(
                    height: 345.h,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/image/ss/bg1.png'),
                        fit: BoxFit.cover, // 图片填充方式
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Repayment Amount',
                          style:
                              TextStyle(color: Colors.white, fontSize: 30.sp),
                        ),
                        Text(
                          '6206',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 100.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 6.h, horizontal: 22.h),
                          decoration: BoxDecoration(
                            color: const Color(0xff9f8ae7),
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Text(
                            'Loan period:3 periods',
                            style:
                                TextStyle(color: Colors.white, fontSize: 30.sp),
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomCard(
                    list: controller.a,
                  ),
                  Container(
                      // height: 777.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.h),
                        color: Colors.white,
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 30.h),
                      padding: EdgeInsets.symmetric(
                          horizontal: 30.w, vertical: 30.h),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Period',
                              style: TextStyle(
                                  fontSize: 30.sp, fontWeight: FontWeight.bold
                                  ),
                            ),
                            const BorderText(
                              text: '01',
                              list: [
                                {
                                  'name': 'Repayment amount',
                                  'value': '10,000.00'
                                },
                                {
                                  'name': 'Repayment time',
                                  'value': '26/2/2023'
                                },
                              ],
                            ),
                            const BorderText(
                              text: '02',
                              list: [
                                {
                                  'name': 'Repayment amount',
                                  'value': '10,000.00'
                                },
                                {
                                  'name': 'Repayment time',
                                  'value': '26/2/2023'
                                },
                              ],
                            ),
                            const BorderText(
                              text: '03',
                              list: [
                                {
                                  'name': 'Repayment amount',
                                  'value': '10,000.00'
                                },
                                {
                                  'name': 'Repayment time',
                                  'value': '26/2/2023'
                                },
                              ],
                            ),
                          ])),
                  SizedBox(
                    height: 50.h,
                  ),
                  const Text(
                    textAlign: TextAlign.center,
                    'Information security guarantee',
                    style: TextStyle(color: Colors.white),
                  ),
                  CustomBtn(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Apply',
                        style: TextStyle(
                            fontSize: 30.w,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  )),
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      text: 'The loan service is provided by ',
                      children: <TextSpan>[
                        TextSpan(
                            text: '#company name#',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            )),
                        TextSpan(
                            text:
                                '.\nIf you have any questions, please contact: '),
                        TextSpan(
                            text: '#phone#',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }));
  }
}
