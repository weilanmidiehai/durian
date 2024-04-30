import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.list});

  final List list;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 730.h,
      width: double.maxFinite,
      margin: EdgeInsets.fromLTRB(30.w, 0, 15.w, 0),
      padding: EdgeInsets.fromLTRB(30.w, 0, 45.w, 40.h),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/image/ss/bg2.png'),
          fit: BoxFit.fitWidth, // 图片填充方式
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // color: Colors.pink,
            alignment: Alignment.centerLeft,
            height: 100.h,
            child: Text('Repayment',
                style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: 50.h,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                list.length,
                (index) => Expanded(
                    child: Center(
                  child: Container(
                    height: 60.h,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(999),
                        border: Border.all(
                            color: Colors.grey.withOpacity(0.5), width: 1.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${list[index]['name']}'),
                        Text('${list[index]['value']}',
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
