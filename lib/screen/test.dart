import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

import 'aa.dart';

class Test extends StatelessWidget {
  Test({super.key});

//图片列表
  List<Map> imgList = [
    {"assets": "assets/image/lb01.png"},
    {"assets": "assets/image/lb01.png"},
    {"assets": "assets/image/lb01.png"},
    {"assets": "assets/image/lb01.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Test")),
      body: ListView(
        children: [
          ElevatedButton(onPressed: (){
            Navigator.push(
                  context,
                  MaterialPageRoute(
                   builder: (context) =>   AAA(),
                  ),
                );
              }, child: const Text('111')),
          SizedBox(
            child: Column(
              children: <Widget>[
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.w),
                  height: 100,
                  child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return Image.asset(
                        imgList[index]["assets"],
                        fit: BoxFit.fill,
                      );
                    },
                    itemCount: imgList.length,
                    viewportFraction: 0.4,
                    scale: 0.8,
                    autoplay: true,
                    //自动播放
                  ),
                ),
                SizedBox(
                  height: 100.0,
                  child: Swiper(
                    outer: true,
                    //是否显示外框
                    fade: 0.1,
                    //透明度
                    viewportFraction: 0.3,
                    //占屏幕比例
                    scale: 0.1,
                    //缩放比例
                    autoplay: true,
                    //自动播放


                    itemBuilder: (c, i) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            imgList[i]["assets"],
                            fit: BoxFit.fill,
                          ),
                          const Text('data')
                        ],
                      );
                    },

                    // pagination: const SwiperPagination(
                    //     alignment: Alignment.topCenter),
                    itemCount: imgList.length,
                    itemWidth: 300.0,
                    itemHeight: 100.0,

                  ),
                ),
                SizedBox(
                  width: 900,
                  height: 300,
                  child: Swiper(
                    autoplay: true,
                    layout: SwiperLayout.CUSTOM,
                    customLayoutOption: CustomLayoutOption(startIndex: 0, stateCount: 3)
                      ..addScale([
                        0.7,
                        1.0,
                        0.7,
                      ], Alignment.center)
                      ..addOpacity([
                        1.0,
                        1.0,
                        1.0,
                      ])
                      ..addTranslate([
                        const Offset(-150.0, 0),
                        const Offset(0.0, 0.0),
                        const Offset(150.0, 0),
                      ]),
                    itemWidth: 230.0,
                    itemHeight: 150.0,
                    fade: 0.1,
                    outer: true, viewportFraction: 0.3,
                    scale: 0.1,
                    itemBuilder: (context, index) {
                      //https://blog.csdn.net/gloryFlow/article/details/134715733
                      //教程链接
                      return Image.asset(
                        imgList[index]['assets'],
                      );
                    },
                    itemCount: imgList.length,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
